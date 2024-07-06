class AddSizeToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :size, :string
  end
end
