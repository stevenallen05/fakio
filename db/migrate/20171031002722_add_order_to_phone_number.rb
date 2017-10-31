class AddOrderToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_numbers, :order, :integer
  end
end
