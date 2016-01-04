web: bundle exec rackup -p $PORT --host 0.0.0.0
worker: bundle exec sidekiq -r ./lib/workers/some.rb -C sidekiq.yml
