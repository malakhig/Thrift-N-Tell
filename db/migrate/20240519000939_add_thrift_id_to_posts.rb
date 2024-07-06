class AddThriftIdToPosts < ActiveRecord::Migration[7.1]
  def change
    add_reference :posts, :thrift, null: false, foreign_key: true
  end
end
