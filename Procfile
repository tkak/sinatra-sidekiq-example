web: bundle exec rackup -p $PORT -e $RACK_ENV --host 0.0.0.0
worker: bundle exec sidekiq -r ./lib/some_worker.rb -C sidekiq.yml
