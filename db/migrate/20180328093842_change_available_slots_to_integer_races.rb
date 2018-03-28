class ChangeAvailableSlotsToIntegerRaces < ActiveRecord::Migration[5.1]
  def change
    change_column :races, :available_slots, 'integer USING available_slots::integer'
  end
end
