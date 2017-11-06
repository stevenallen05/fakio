# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  subject(:phone_number) { create :phone_number, pattern: pattern }

  let(:pattern) { '.*9' }

  it { is_expected.to be_valid }
end
