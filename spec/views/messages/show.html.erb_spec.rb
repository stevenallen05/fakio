# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'messages/show', type: :view do
  before { @message = create :message }

  it 'renders attributes in <p>' do
    render
    expect(rendered).to include(@message.from)
    expect(rendered).to include(@message.to)
    expect(rendered).to include(@message.body)
  end
end
