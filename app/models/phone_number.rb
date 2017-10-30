# frozen_string_literal: true

class PhoneNumber < ApplicationRecord
    enum status: { mobile: :mobile, landline: :landline, invalid: :invalid }
end
