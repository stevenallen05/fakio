# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'POST post_message_path' do

    subject(:json_response) { JSON.parse(response.body) }

    let(:message_attributes) {
      {
        "account_sid": '',
        "Body": 'Jenny please?! I love you <3',
        "From": '+14158141829',
        "To": '+15558675309'
      }
    }

    before { post post_message_path(sid: 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), params: message_attributes }

    it { expect(response).to have_http_status(:created) }
    it { expect(json_response['Price']).to eq '0.03' }
    it { expect(json_response['Status']).to eq 'sent' }
    it { expect(DateTime.parse(json_response['DateSent'])).to be_a DateTime }
  end
end
