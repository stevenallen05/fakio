# frozen_string_literal: true

class V1::PhoneNumbersController < ApplicationController
  before_action :set_fake_lookup
  def lookup
    if %w[landline mobile].include? @fake_lookup.status
      render json: @fake_lookup.to_json
    else
      render json: NotFoundPresenterService.new(number: params[:phone_number]).to_json, status: 404
    end
  end

  private
    def set_fake_lookup
      @fake_lookup = PhoneNumberPresenterService.new(number: params[:phone_number], url: request.url)
    end
end
