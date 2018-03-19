class ChangeNumberFieldsToFloatInRaces < ActiveRecord::Migration[5.1]
  def change
    change_column :races, :distance_swim, :float
    change_column :races, :distance_bike, :float
    change_column :races, :distance_run, :float
    change_column :races, :vertical_ascent_bike, :float
    change_column :races, :vertical_ascent_run, :float
  end
end
