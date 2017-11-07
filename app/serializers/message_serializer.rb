# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :Status, :Price, :DateSent, :sid

  def DateSent
      object.created_at
  end

  def Price
      '0.03'
  end

  def Status
      'sent'
  end

  def sid
    SecureRandom.hex(13)
  end
end
