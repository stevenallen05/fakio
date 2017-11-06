# frozen_string_literal: true

class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1599 }
  validates :to, presence: true
end
