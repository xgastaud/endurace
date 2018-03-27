class AddRunningGpxUrlToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :Running_gpx_url, :string
  end
end
