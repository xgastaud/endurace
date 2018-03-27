class AddPublishedFieldToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :Published, :boolean, default: false
  end
end
