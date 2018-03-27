class UncapitalizePublishedInRaces < ActiveRecord::Migration[5.1]
  def change
    rename_column :races, :Published, :published
  end
end
