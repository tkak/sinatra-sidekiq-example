require './app'
require 'sidekiq/web'

run Rack::URLMap.new('/' => SomeApp, '/sidekiq' => Sidekiq::Web)
