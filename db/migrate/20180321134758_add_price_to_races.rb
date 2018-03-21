class AddPriceToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :price, :integer
  end
end
