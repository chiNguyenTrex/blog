class ChangeContentTypeInComments < ActiveRecord::Migration[5.1]
  def change
    change_column :comments, :content, :string
  end
end
