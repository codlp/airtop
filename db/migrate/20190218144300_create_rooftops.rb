class CreateRooftops < ActiveRecord::Migration[5.2]
  def change
    create_table :rooftops do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :address
      t.text :description
      t.decimal :price_per_hour, precision: 10, scale: 2

      t.timestamps
    end
  end
end
