FROM ruby:2.3

RUN gem install rspec && \
  gem install pry && \
  mkdir /code

WORKDIR /code
