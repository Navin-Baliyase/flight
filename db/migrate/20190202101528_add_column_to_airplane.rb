class AddColumnToAirplane < ActiveRecord::Migration[5.2]
  def change
    add_column :airplanes, :source, :string
    add_column :airplanes, :destination, :string
    add_column :airplanes, :price, :float
  end
end
