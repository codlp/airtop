class AddDefaulttoStatustoRes < ActiveRecord::Migration[5.2]
  def change
    change_column_default :reservations, :status, "Pending"
  end
end
