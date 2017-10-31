# frozen_string_literal: true

class V1::PhoneNumbersController < ApplicationController
  def lookup
    render PhoneNumberPresenterService.new(number: params[:phone_number], url: request.url).to_json
  end
end
