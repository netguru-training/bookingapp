class RenameConfirmationToConfirmed < ActiveRecord::Migration
  def change
    rename_column :bookings, :confirmation, :confirmed
  end
end
