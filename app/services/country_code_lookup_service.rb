# frozen_string_literal: true

class CountryCodeLookupService
  include Singleton

  def initialize
    @country_data = YAML.load(File.read(Rails.root + 'data' + 'countries.yml')).with_indifferent_access
  end

  def find_country(country_code)
    @country_data[country_code].symbolize_keys
  end
end
