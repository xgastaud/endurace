class AddColumnPhotoScrToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :image_race, :string
  end
end
