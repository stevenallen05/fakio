class CreatePhoneNumbers < ActiveRecord::Migration[5.1]
  def change
    create_table :phone_numbers do |t|
      t.string :pattern
      t.string :country
      t.boolean :legit

      t.timestamps
    end
  end
end
