# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    from '+11111111111'
    to '+11111111111'
    body 'Lorem ipsum'
  end
end
