class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :pnr
      t.string :origin
      t.string :destination
      t.decimal :price
      t.references :airplane, foreign_key: true

      t.timestamps
    end
  end
end
