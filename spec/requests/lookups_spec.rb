# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lookups', type: :request do
  describe 'GET /lookups' do
    before { get phone_number_lookup_path, params: { phone_number: phone_number } }
    let(:json_response) { JSON.parse(response.body) }

    context 'with a blank number' do
      let(:phone_number) { '' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response).not_to have_key('country_code') }
      it { expect(json_response).not_to have_key('carrier') }
    end

    context 'with a nil phone number' do
      let(:phone_number) { '' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response).not_to have_key('country_code') }
      it { expect(json_response).not_to have_key('carrier') }
    end

    context 'with a Canadian-matching number ending in a number other than 8 or 9', :focus do
      let(:phone_number) { '+16043334444' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response['country_code']).to eq 'CA' }
      it { expect(json_response['carrier']['type']).to eq 'mobile' }
      it { expect(json_response).to have_key('caller_name') }

      it { ap json_response }
    end

    context 'with an American-matching number ending in a number other than 8 or 9' do
      let(:phone_number) { '+12223334444' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response['country_code']).to eq 'US' }
      it { expect(json_response['carrier']['type']).to eq 'mobile' }
    end

    context 'with an Australian-matching number ending in a number other than 8 or 9' do
      let(:phone_number) { '+61222333444' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response['country_code']).to eq 'AU' }
      it { expect(json_response['carrier']['type']).to eq 'mobile' }
    end

    context 'with an American-matching number ending in 8' do
      let(:phone_number) { '+12223334448' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response['country_code']).to eq 'US' }
      it { expect(json_response['carrier']['type']).to eq 'landline' }
    end

    context 'with an Australian-matching number ending in 8' do
      let(:phone_number) { '+61222333448' }

      it { expect(response).to have_http_status(200) }
      it { expect(json_response['country_code']).to eq 'AU' }
      it { expect(json_response['carrier']['type']).to eq 'landline' }
    end

    context 'with an American-matching number ending in 9' do
      let(:phone_number) { '+12223334449' }

      it { expect(response).to have_http_status(404) }
    end

    context 'with an Australian-matching number ending in 9' do
      let(:phone_number) { '+61222333449' }

      it { expect(response).to have_http_status(404) }
    end
  end
end
