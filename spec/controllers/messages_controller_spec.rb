# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :controller do

  let(:valid_attributes) {
    {
      "account_sid": 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX',
      "body": 'Jenny please?! I love you <3',
      "from": '+14158141829',
      "sid": 'MM90c6fc909d8504d45ecdb3a3d5b3556e',
      "to": '+15558675309'
   }
  }

  let(:invalid_attributes) {
    skip('Add a hash of attributes invalid for your model')
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      message = create :message
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      message = create :message
      get :show, params: { id: message.to_param }, session: valid_session
      expect(response).to be_success
    end
  end
end
