require 'sidekiq'
require 'sinatra/base'
require_relative 'lib/some_worker'

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

$redis = Redis.new( url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" )

class App < Sinatra::Application
  get '/things' do
    things = $redis.hvals('things')
    status 200
    things.to_json
  end
  
  post '/things' do
    content_type :json
    req = JSON.load(request.body.read.to_s)
    $redis.hset('things', req['id'], req['thing'])
    SomeWorker.perform_async(req['id'])
    "enqueue #{req['id']}, #{req['thing']}"
    status 202
  end
end
