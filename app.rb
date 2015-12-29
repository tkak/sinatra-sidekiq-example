require 'sidekiq'
require 'sinatra'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

$redis = Redis.new( url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" )

class SomeWorker
  include Sidekiq::Worker
  def perform(id)
    thing = $redis.get(id)
    sleep 10
    p "The work is done: #{thing}"
  end
end

get '/things' do
  things = $redis.keys("*")
  things.to_json
end

post '/things' do
  content_type :json
  req = JSON.load(request.body.read.to_s)
  $redis.set(req['id'], req['thing'])
  SomeWorker.perform_async(req['id'])
  "enqueue #{req['id']}, #{req['thing']}"
end
