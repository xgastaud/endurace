class AddPhotoToRaces < ActiveRecord::Migration[5.1]
  def change
    add_column :races, :photo, :string
  end
end
