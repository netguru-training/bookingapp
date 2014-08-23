class AddStreeAndCitytToPlace < ActiveRecord::Migration
  def change
    add_column :places, :street, :string
    add_column :places, :city, :string
  end
end
