# README

Ruby version: `2.7.1`

## Prerequisites 

### rbenv
First install [rbenv](https://github.com/rbenv/rbenv), see instructions [here](https://github.com/rbenv/rbenv#homebrew-on-macos).

### Redis
```
brew install redis
```

### Postgres
```
brew install postgres (?)
```

### Mailcatcher
```
brew install mailcatcher
```

## Setup

Only run this the first time you setup your project.
```
# Install ruby version and the bundler
rbenv install 2.7.1
gem install bundler

# Clone the repo
cd webhooks

bundle install
rails db:setup # only run this the first time your clone

cp .env.example .env
# Populate the .env file
```

### Development

Run the following to run the app locally:

```
rails server

# start sidekiq in another terminal
bundle exec sidekiq -c config/sidekiq.yml
```
