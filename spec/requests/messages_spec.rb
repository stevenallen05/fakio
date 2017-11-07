# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Messages', type: :request do
  describe 'POST post_message_path' do

    subject(:json_response) { JSON.parse(response.body) }

    let(:message_attributes) {
      {
        "account_sid": '',
        "body": 'Jenny please?! I love you <3',
        "from": '+14158141829',
        "sid": 'MM90c6fc909d8504d45ecdb3a3d5b3556e',
        "to": '+15558675309'
      }
    }

    before { post post_message_path(sid: 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'), params: message_attributes }

    it { expect(response).to have_http_status(:created) }
    it { expect(json_response['price']).to eq '0.03' }
    it { expect(json_response['status']).to eq 'sent' }
    it { expect(DateTime.parse(json_response['datesent'])).to be_a DateTime }
  end
end
