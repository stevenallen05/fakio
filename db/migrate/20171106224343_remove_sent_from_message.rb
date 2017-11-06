class RemoveSentFromMessage < ActiveRecord::Migration[5.1]
  def change
    remove_column :messages, :sent, :boolean
  end
end
