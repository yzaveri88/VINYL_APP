class AddCoordinatesToRecords < ActiveRecord::Migration[5.2]
  def change
    add_column :records, :address, :string
    add_column :records, :latitude, :float
    add_column :records, :longitude, :float
  end
end
