class AddLatitudeAndLongitudeToThrifts < ActiveRecord::Migration[7.1]
  def change
    add_column :thrifts, :latitude, :float
    add_column :thrifts, :longitude, :float
  end
end
