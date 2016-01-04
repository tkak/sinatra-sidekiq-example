require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://#{ENV['REDIS_HOST']}:#{ENV['REDIS_PORT']}" }
end

class SomeWorker
  include Sidekiq::Worker
  def perform(id)
    thing = $redis.hget('things', id)
    sleep 10
    p "The work is done: #{thing}"
  end
end
