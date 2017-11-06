# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(get: '/messages').to route_to('messages#index')
    end

    it 'routes to #show' do
      expect(get: '/messages/1').to route_to('messages#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/2010-04-01/Accounts/1/Messages').to route_to('messages#create', sid: '1')
    end
  end
end
