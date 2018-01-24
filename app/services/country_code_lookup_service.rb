# frozen_string_literal: true

class CountryCodeLookupService
  include Singleton

  def initialize
    @country_data = YAML.load(File.read(Rails.root + 'data' + 'countries.yml')).with_indifferent_access
    @known_area_codes = YAML::load_file(File.join(Rails.root, 'config', 'known_area_codes.yml')).symbolize_keys
  end

  def find_country(phone_number)
    return @country_data['canada'].symbolize_keys if @known_area_codes[:canadian].include? phone_number.area_code.to_i
    @country_data[phone_number.country_code].symbolize_keys
  end
end
