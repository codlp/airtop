class AddCoordinatesToRooftops < ActiveRecord::Migration[5.2]
  def change
    add_column :rooftops, :latitude, :float
    add_column :rooftops, :longitude, :float
  end
end
