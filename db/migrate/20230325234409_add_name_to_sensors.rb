class AddNameToSensors < ActiveRecord::Migration[7.0]
  def change
    add_column :sensors, :name, :string
  end
end
