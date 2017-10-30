# frozen_string_literal: true

json.array! @phone_numbers, partial: 'phone_numbers/phone_number', as: :phone_number
