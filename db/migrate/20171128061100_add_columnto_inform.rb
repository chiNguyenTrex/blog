class AddColumntoInform < ActiveRecord::Migration[5.1]
  def change
    add_column :informs, :test, :string
  end
end
