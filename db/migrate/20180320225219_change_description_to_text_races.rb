class ChangeDescriptionToTextRaces < ActiveRecord::Migration[5.1]
  def change
    change_column :races, :description, :text
  end
end
