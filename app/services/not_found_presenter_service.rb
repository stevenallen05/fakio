# frozen_string_literal: true

class NotFoundPresenterService
  def initialize(number:)
    @number = number
  end

  def to_json
    {
      "code": 20404,
      "message": "The requested resource /PhoneNumbers/#{@number} was not found",
      "more_info": 'https://www.twilio.com/docs/errors/20404',
      "status": 404
    }.to_json
  end
end
