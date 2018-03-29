class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :city
      t.integer :user_id

      t.timestamps
    end
    add_index :addresses, :user_id
  end
end
