class RenameColumnsInRaces < ActiveRecord::Migration[5.1]
  def change
    rename_column :races, :Swimming_gpx_url, :swimming_gpx_url
    rename_column :races, :Biking_gpx_url, :biking_gpx_url
    rename_column :races, :Running_gpx_url, :running_gpx_url
  end
end
