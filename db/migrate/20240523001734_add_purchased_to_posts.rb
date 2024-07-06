class AddPurchasedToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :purchased, :boolean
  end
end
