# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :status, :price, :datesent

  def datesent
      object.created_at
  end

  def price
      '0.03'
  end

  def status
      'sent'
  end
end
