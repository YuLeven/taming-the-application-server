FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /puma_app
WORKDIR /puma_app
COPY Gemfile /puma_app/Gemfile
COPY Gemfile.lock /puma_app/Gemfile.lock
RUN bundle install
COPY . /puma_app

# Add a script to be executed every time the container starts.
EXPOSE 3000