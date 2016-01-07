web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: bundle exec sidekiq -r ./lib/some_worker.rb -C ./config/sidekiq.yml
