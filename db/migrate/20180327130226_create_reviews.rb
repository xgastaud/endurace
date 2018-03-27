class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :score
      t.text :comment
      t.references :race, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
