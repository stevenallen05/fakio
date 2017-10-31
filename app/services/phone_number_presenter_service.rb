# frozen_string_literal: true

class PhoneNumberPresenterService
  def initialize(number:, url:)
    @number = Phoner::Phone.parse(number)
    @matcher = find_matcher
    @country_data = CountryCodeLookupService.instance.find_country(@number.country_code)
    @url = url
  end

  def status
    @matcher&.status
  end

  def to_json
    {
      "caller_name": 'null',
      "country_code": @country_data[:char_3_code],
      "phone_number": @number.to_s,
      "national_format": @number.to_s,
      "carrier": {
        "mobile_country_code": '999',
        "mobile_network_code": '999',
        "name": 'Fake Phone Company, LLC',
        "type": @matcher.status,
        "error_code": 'null'
      },
      "add_ons": 'null',
      "url": @url
    }.to_json
  end

  private
    def find_matcher
      matcher = nil
      PhoneNumber.all.order(:order).each do |ph|
        matcher = ph if /#{ph.pattern}/.match?(@number.to_s)
        break if matcher.present?
      end
      matcher
    end
end

=begin
"caller_name":null,
"country_code":"CA",
"phone_number":"+17787140588",
"national_format":"(778) 714-0588",
"carrier":{
"mobile_country_code":"302",
"mobile_network_code":"490",
"name":"Freedom Mobile Inc.",
"type":"mobile",
"error_code":null
},
"add_ons":null,
"url":"https://lookups.twilio.com/v1/PhoneNumbers/+17787140588?Type=carrier"
=end
