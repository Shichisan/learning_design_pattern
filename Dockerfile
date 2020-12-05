FROM ruby:2.7.2

RUN apt-get update && \
    apt-get install -y build-essential \
    libpq-dev \
    nodejs

RUN mkdir /app
ENV APP_ROOT /app
WORKDIR $APP_ROOT

ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

RUN bundle install
ADD . $APP_ROOT
