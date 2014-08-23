class AddMissingIndexes < ActiveRecord::Migration
  def change
    add_index :bookings, :user_id
    add_index :bookings, :place_id
    add_index :places , :user_id
    add_index :reviews, :place_id
    add_index :reviews , :user_id
  end
end
