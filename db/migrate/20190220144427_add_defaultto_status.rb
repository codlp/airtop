class AddDefaulttoStatus < ActiveRecord::Migration[5.2]
  def change
    change_column_null :reservations, :status, "Pending"
  end
end
