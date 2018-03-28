class CreateInforms < ActiveRecord::Migration[5.1]
  def change
    create_table :informs do |t|
      t.string :title
      t.text :content
      t.text :receivers

      t.timestamps
    end
  end
end
