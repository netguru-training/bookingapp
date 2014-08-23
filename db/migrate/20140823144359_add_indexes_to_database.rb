class AddIndexesToDatabase < ActiveRecord::Migration
  def change
    add_index :bookings, :confirmed
    add_index :bookings, [:place_id, :confirmed]
  end
end
