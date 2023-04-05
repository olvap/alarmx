class AddStateToSceneSensors < ActiveRecord::Migration[7.0]
  def change
    add_column :scene_sensors, :state, :boolean
  end
end
