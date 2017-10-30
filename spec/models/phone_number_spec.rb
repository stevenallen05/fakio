# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:pattern) { '.*9' }
  let(:phone_number) { create :phone_number, pattern: pattern }

  it { is_expected.to be_valid }
end
