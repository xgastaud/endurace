class AddBikingGpxUrlToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :Biking_gpx_url, :string
  end
end
