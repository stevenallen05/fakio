# frozen_string_literal: true

system 'rm tmp/ -rf'
system 'bundle exec rails db:setup'
system 'bundle exec rails s -b 0.0.0.0'
