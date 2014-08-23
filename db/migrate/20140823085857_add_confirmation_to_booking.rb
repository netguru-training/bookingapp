class AddConfirmationToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :confirmation, :boolean, default: false
  end
end
