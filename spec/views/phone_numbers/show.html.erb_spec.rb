require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :pattern => "Pattern",
      :country => "Country",
      :legit => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pattern/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/false/)
  end
end
