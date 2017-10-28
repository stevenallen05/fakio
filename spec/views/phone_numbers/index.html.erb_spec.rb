require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :pattern => "Pattern",
        :country => "Country",
        :legit => false
      ),
      PhoneNumber.create!(
        :pattern => "Pattern",
        :country => "Country",
        :legit => false
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Pattern".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
