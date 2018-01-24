# frozen_string_literal: true

class PhoneNumberPresenterService
  def initialize(number:, url:)
    @number = Phoner::Phone.parse(number)
    @matcher = find_matcher
    @country_data = CountryCodeLookupService.instance.find_country(@number) if @number
    @url = url
  end

  def status
    @matcher&.status
  end

  def to_json
    return { url: 'https://lookups.twilio.com/v1/PhoneNumbers',
            links: { "phone_number": 'https://lookups.twilio.com/v1/PhoneNumbers/{PhoneNumber}' }
          } if @number.nil?
    {
      "country_code": @country_data.try(:[], :char_3_code),
      "phone_number": @number.to_s,
      "national_format": @number.to_s,
      "caller_name": caller_id_info,
      "carrier": {
        "mobile_country_code": '999',
        "mobile_network_code": '999',
        "name": 'Fake Phone Company, LLC',
        "type": @matcher.status,
        "error_code": nil
      },
      "add_ons": nil,
      "url": @url
    }.to_json
  end

  private

    def caller_id_info
      caller_type = %w[business consumer].sample
      ffaker = caller_type == 'business' ? FFaker::Company : FFaker::Name
      {
          "caller_name": ffaker.name,
          "caller_type": caller_type.upcase,
          "error_code": nil,
      }
    end

    def find_matcher
      matcher = nil
      PhoneNumber.all.order(:order).each do |ph|
        matcher = ph if /#{ph.pattern}/.match?(@number.to_s)
        break if matcher.present?
      end
      matcher
    end
end
