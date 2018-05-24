class AddLatitudeAndLongitudeToRecord < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :latitude, :float
    add_column :records, :longitude, :float
  end
end
