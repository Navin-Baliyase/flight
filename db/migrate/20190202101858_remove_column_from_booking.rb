class RemoveColumnFromBooking < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :origin, :string
    remove_column :bookings, :destination, :string
    remove_column :bookings, :price, :decimal
  end
end
