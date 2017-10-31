class AddStatusToPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    add_column :phone_numbers, :status, :string
  end
end
