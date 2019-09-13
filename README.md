# Simple clicker app

# Installation

Make sure you have a JavaScript runtime such as node installed.

## If you do not have ruby installed

Install ruby version 2.6.0 with [rbenv](https://github.com/rbenv/rbenv).

Install bundler with `gem install bundler`

## If you already have ruby and bundler installed

run `bundle install` to install all dependencies specified in the Gemfile

## For development version

Run migrations with `rails db:migrate`

Run `rails s` to start the project in development mode

### Development version with Docker

If you want to use Docker to run the development version of the project, build and run it following commands:

```bash
docker build -t rails_example .
docker build run --name rails_test -p 3000:3000 rails_example
```

And open localhost:3000 in your favourite web browser.


## For production version

Run migrations with `rails db:migrate RAILS_ENV=production`

Precompile your assets with `rake assets:precompile`

Run `rails s -e production` to start the project in production mode

(To get error output use `RAILS_LOG_TO_STDOUT=true rails s -e production`)

### The application by default runs in port 3000
