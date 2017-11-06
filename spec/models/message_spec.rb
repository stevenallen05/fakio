# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  subject { build :message }

  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:to) }
  it { is_expected.to validate_length_of(:body).is_at_most(1599) }
end
