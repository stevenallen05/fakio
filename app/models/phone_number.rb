# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
  enum status: { mobile: :mobile, landline: :landline, bad_number: :bad_number }
end
