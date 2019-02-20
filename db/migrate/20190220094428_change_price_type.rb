class ChangePriceType < ActiveRecord::Migration[5.2]
  def change
    change_column :rooftops, :price_per_hour, :integer
  end
end
