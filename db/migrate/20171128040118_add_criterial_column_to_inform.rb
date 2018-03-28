class AddCriterialColumnToInform < ActiveRecord::Migration[5.1]
  def change
    add_column :informs, :criteria, :text
  end
end
