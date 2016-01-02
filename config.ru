require './app'

run Rack::URLMap.new('/' => SomeApp, '/sidekiq' => Sidekiq::Web)
