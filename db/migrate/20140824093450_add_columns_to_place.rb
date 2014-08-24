class AddColumnsToPlace < ActiveRecord::Migration
  def change
    add_column :places, :available_from, :datetime, default: Time.now
    add_column :places, :available_to, :datetime
    add_column :places, :beds, :integer, default: 1
  end
end
