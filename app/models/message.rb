# frozen_string_literal: true

class Message < ApplicationRecord
  validates :body, presence: true, length: { maximum: 1599 }
  validates :to, presence: true

  default_scope { order(created_at: :desc) }

  def sent
    created_at
  end


  # def date
  #     valid? ? { 'datesent' => sent } : {}
  # end

  # def price
  #     { 'price' => valid? ? '0.03' : '0.00' }
  # end

  # def status
  #     { 'status' => valid? ? 'sent' : 'failed' }
  # end
end
