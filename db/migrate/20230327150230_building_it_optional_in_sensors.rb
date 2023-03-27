class BuildingItOptionalInSensors < ActiveRecord::Migration[7.0]
  def change
    change_column :sensors, :building_id, :integer, null: true
  end
end
