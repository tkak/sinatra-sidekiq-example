FROM ruby:2.2.4
RUN gem install bundler

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

WORKDIR /opt/sinatra-sidekiq-api

EXPOSE 5000
