class AddLikesToComments < ActiveRecord::Migration[7.1]
  def change
    add_column :comments, :likes, :integer
  end
end
