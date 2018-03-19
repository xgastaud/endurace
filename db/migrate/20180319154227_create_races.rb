class CreateRaces < ActiveRecord::Migration[5.1]
  def change
    create_table :races do |t|
      t.string :name
      t.string :sport
      t.string :format
      t.datetime :starts_at
      t.string :address
      t.string :year
      t.string :description
      t.string :url
      t.string :registration_url
      t.string :available_slots
      t.integer :distance_swim
      t.integer :distance_bike
      t.integer :distance_run
      t.integer :vertical_ascent_bike
      t.integer :vertical_ascent_run

      t.timestamps
    end
  end
end
