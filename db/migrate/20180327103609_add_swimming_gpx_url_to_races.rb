class AddSwimmingGpxUrlToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :Swimming_gpx_url, :string
  end
end
