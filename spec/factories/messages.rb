# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    from { FFaker::PhoneNumber.phone_number } #'+11111111111'
    to { FFaker::PhoneNumber.phone_number }# '+11111111111'
    body { FFaker::Lorem.phrase }
    sequence(:created_at) { |n| n.days.ago }
  end
end
