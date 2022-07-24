class CreateAccountTable < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :username, unique: true, null: false
      t.string :auth_id, null: false
      t.timestamps
    end
  end
end
