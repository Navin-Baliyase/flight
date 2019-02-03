class AddColumnToBook < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :age, :integer
    add_column :bookings, :passport_id, :string
    add_column :bookings, :passenger1, :string
    add_column :bookings, :passenger2, :string
  end
end
