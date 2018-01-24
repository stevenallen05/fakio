# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/index', type: :view do
  let!(:messages) { create_list :message, 2 }

  before { assign(:messages, Message.all.page) }

  it 'renders a list of messages' do
    render
    messages.each do |message|
      assert_select 'tr>td', text: message.from, count: 1
      assert_select 'tr>td', text: message.to, count: 1
      assert_select 'tr>td', text: message.body, count: 1
      assert_select 'tr>td', text: /#{message.sent.strftime('%c')}/, count: 1
    end
  end
end
