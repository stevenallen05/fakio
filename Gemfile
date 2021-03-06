# frozen_string_literal: true

source 'https://rubygems.org'
gem 'dotenv-rails', groups: [:development, :test]

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'

gem 'active_model_serializers'
# Use sqlite3 as the database for Active Record
gem 'mysql2'
gem 'pg'
gem 'sqlite3'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'ffaker'
gem 'iso_country_codes'
gem 'phone'

gem 'materialize-sass'

gem 'kaminari'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'awesome_print'
  gem 'byebug'
  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false
  gem 'httplog'
  gem 'rubocop'
end

group :test do
  gem 'factory_bot_rails', '~> 4'
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rspec_junit_formatter'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'twilio-ruby'                     # API integration with twilio SMS service
end
