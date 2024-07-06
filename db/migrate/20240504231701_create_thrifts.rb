class CreateThrifts < ActiveRecord::Migration[7.1]
  def change
    create_table :thrifts do |t|
      t.string :store
      t.string :address
      t.string :phone
      t.string :city
      t.string :state
      t.string :hours

      t.timestamps
    end
  end
end
