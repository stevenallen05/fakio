
# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhoneNumbersController, type: :routing do
  describe 'routing' do

      it 'routes to #lookup' do
          expect(get: 'v1/PhoneNumbers/+17787140588?Type=carrier').to route_to('phone_numbers#lookup',
                                                                               phone_number: '+17787140588',
                                                                               Type: 'carrier')
        end
    end
end
