class AddUserIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :userId, :integer
    add_index :users, :userId
  end
end
