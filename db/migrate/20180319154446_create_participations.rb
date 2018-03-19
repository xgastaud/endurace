class CreateParticipations < ActiveRecord::Migration[5.1]
  def change
    create_table :participations do |t|
      t.references :race, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
