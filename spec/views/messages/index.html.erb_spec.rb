# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/index', type: :view do
  before do
    assign(:messages, [
      Message.create!(
        from: 'From',
        to: 'To',
        body: 'Body',
        send: false
      ),
      Message.create!(
        from: 'From',
        to: 'To',
        body: 'Body',
        send: false
      )
    ])
  end

  it 'renders a list of messages' do
    render
    assert_select 'tr>td', text: 'From'.to_s, count: 2
    assert_select 'tr>td', text: 'To'.to_s, count: 2
    assert_select 'tr>td', text: 'Body'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
