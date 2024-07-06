class DropPosts < ActiveRecord::Migration[7.1]
 def up
    drop_table :posts
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
