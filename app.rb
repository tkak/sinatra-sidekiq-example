require 'sidekiq'
require 'sinatra'

#Sidekiq.configure_server do |config|
#  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
#end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

#$redis = Redis.new()

class SomeWorker
  include Sidekiq::Worker
  def perform(id)
    p id
  end
end

get '/things' do
  p 'hoge' 
end

post '/things' do
  SomeWorker.perform_async(1)
  redirect to('/things')
end

