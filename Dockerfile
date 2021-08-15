FROM ruby:2.7.4-alpine3.14
RUN apk update -qq
RUN apk add --no-cache build-base nodejs postgresql-dev tzdata less
RUN mkdir /myapp
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
COPY . /myapp

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
