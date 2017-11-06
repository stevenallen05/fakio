# frozen_string_literal: true

class MessageSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :body, :send
end
