# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'phone_numbers/edit', type: :view do
  before do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
                                            pattern: 'MyString',
                                            country: 'MyString',
                                            legit: false
    ))
  end

  it 'renders the edit phone_number form' do
    render

    assert_select 'form[action=?][method=?]', phone_number_path(@phone_number), 'post' do

      assert_select 'input[name=?]', 'phone_number[pattern]'

      assert_select 'input[name=?]', 'phone_number[country]'

      assert_select 'input[name=?]', 'phone_number[legit]'
    end
  end
end
