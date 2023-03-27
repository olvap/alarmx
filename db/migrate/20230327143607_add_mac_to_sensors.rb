class AddMacToSensors < ActiveRecord::Migration[7.0]
  def change
    add_column :sensors, :mac, :string
  end
end
