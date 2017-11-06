# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/index', type: :view do
  before do
    @message = assign(:messages, (build_list :message, 2)).first
  end

  skip it 'renders a list of messages' do
    render
    assert_select 'tr>td', text: @message.from, count: 2
    assert_select 'tr>td', text: @message.to, count: 2
    assert_select 'tr>td', text: @message.body, count: 2
    assert_select 'tr>td', text: @message.sent.to_s, count: 2
  end
end
