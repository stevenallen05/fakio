# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'phone_numbers/new', type: :view do
  before do
    assign(:phone_number, PhoneNumber.new(
                            pattern: 'MyString',
                            country: 'MyString',
                            legit: false
    ))
  end

  it 'renders new phone_number form' do
    render

    assert_select 'form[action=?][method=?]', phone_numbers_path, 'post' do

      assert_select 'input[name=?]', 'phone_number[pattern]'

      assert_select 'input[name=?]', 'phone_number[country]'

      assert_select 'input[name=?]', 'phone_number[legit]'
    end
  end
end
