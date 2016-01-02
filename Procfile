web: bundle exec rackup -p $PORT --host 0.0.0.0
worker: bundle exec sidekiq -r ./app.rb -C sidekiq.yml
