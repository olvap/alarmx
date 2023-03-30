class AddPinToSensors < ActiveRecord::Migration[7.0]
  def change
    add_column :sensors, :pin, :string
  end
end
