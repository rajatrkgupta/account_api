class CreateTablePhoneNumber < ActiveRecord::Migration[7.0]
  def change
    create_table :phone_numbers do |t|
      t.string :number, unique: true, null: false
      t.integer :account_id
      t.timestamps
    end
  end
end
