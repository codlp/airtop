class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :rooftop, foreign_key: true
      t.datetime :start_at
      t.datetime :end_at
      t.string :status

      t.timestamps
    end
  end
end
