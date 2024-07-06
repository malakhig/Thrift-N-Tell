class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :attachment
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :location

      t.timestamps
    end
  end
end
