class CreateAirplanes < ActiveRecord::Migration[5.2]
  def change
    create_table :airplanes do |t|
      t.string :name
      t.integer :seats
      t.string :category
      t.string :rows

      t.timestamps
    end
  end
end
