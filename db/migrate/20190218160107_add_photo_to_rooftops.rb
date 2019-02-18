class AddPhotoToRooftops < ActiveRecord::Migration[5.2]
  def change
    add_column :rooftops, :photo, :string
  end
end
