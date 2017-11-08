# Fakio

[![Maintainability](https://api.codeclimate.com/v1/badges/95d64abcd68d3b3dca2e/maintainability)](https://codeclimate.com/github/stevenallen05/fakio/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/95d64abcd68d3b3dca2e/test_coverage)](https://codeclimate.com/github/stevenallen05/fakio/test_coverage)
[![CircleCI](https://circleci.com/gh/stevenallen05/fakio.svg?style=svg)](https://circleci.com/gh/stevenallen05/fakio)

A faked implentation of the Twilio API, written in RoR 5.

## Supported functionality

### Carrier lookups

Uses the [phone gem](https://github.com/carr/phone) to lookup the country code of a phone number. If it can parse the number to a country, the carrier lookup will return some dummy data, along with the guessed country code.

Default rules:

1. A phone number ending in 9 is an unknown number (returns a 404)
2. A phone number ending in 8 is a registered landline number
3. All other phone numbers are considered mobile phone numbers

### Sending SMS

The API will allow sending to any phone number, with all messages collected in the dashboard. 

## Quickstart

Easiest way to get this running quickly in a local environment is via the official Docker image:

`docker run steveallen/fakio`

## Database

The default database engine is SQLite. MySQL/MariaDB and Postgres are also supported. To override, set the DATABASE_URL environment variable to match the following pattern:

`mysql2://<username>:<password>@<hostname or IP address>/<schema name>`

or:

`postgresql://<username>:<password>@<hostname or IP address>/<schema name>`

## Running locally

This assumes you have a working ruby 2.3.5 installation already. If you do not, please consult [rbenv](https://github.com/rbenv/rbenv) or [rvm](https://rvm.io/)

1. Clone the repository:

`git clone https://github.com/stevenallen05/fakio.git && cd fakio`

2. Install gem dependencies:

`bundle install`

3. Set up the database:

`bundle exec rails db:setup`

4. Run the server: 

`bundle exec rails s`


## Accessing the dashboard

By default, either through the docker launcher or runnning locally, the dashboard is accessible at [http://localhost:3000](http://localhost:3000)

## Using Fakio in a Ruby application

If you're using the official [Twilio Ruby gem](https://github.com/twilio/twilio-ruby), directing it to use Fakio is straightforward. When creating any Twilio::REST client, pass in a has with the following values:



Example:

```
# A fake SID, don't bother using it
TWILIO_ACCOUNT_SID = '4f3f1b7e10325be5ce99e2fd2acc07df84b04cedafd0dc42a2337c4fa42e41d8104a'
# A fake auth token, don't bother using it
TWILIO_AUTH_TOKEN = '09948569d3bda9d60ec38137d93fb8f82250d3e86204f57024456aa4f90c5232' 

client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, 
                                   TWILIO_AUTH_TOKEN, 
                                   { host: 127.0.0.1, port: 3000, use_ssl: false })
```
