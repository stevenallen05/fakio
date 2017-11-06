# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before do
    @message = assign(:message, Message.create!(
                                  from: 'From',
                                  to: 'To',
                                  body: 'Body',
                                  send: false
    ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/To/)
    expect(rendered).to match(/Body/)
    expect(rendered).to match(/false/)
  end
end
