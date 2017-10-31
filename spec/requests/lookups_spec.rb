# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Lookups', type: :request do
  describe 'GET /lookups' do
    before { get v1_path, params: { phone_number: phone_number } }
    let(:json_response) { JSON.parse(response.body) }

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
