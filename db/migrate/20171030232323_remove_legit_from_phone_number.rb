class RemoveLegitFromPhoneNumber < ActiveRecord::Migration[5.1]
  def change
    remove_column :phone_numbers, :legit, :boolean
  end
end
