class AddColumnToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :status, :sting
    add_column :bookings, :name, :string
  end
end
