class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :place_id
      t.integer :user_id
      t.datetime :date_from
      t.datetime  :date_to

      t.timestamps
    end
  end
end
