# frozen_string_literal: true

class PhoneNumberSerializer < ActiveModel::Serializer
  attributes :caller_name, :country_code, :phone_number
end
