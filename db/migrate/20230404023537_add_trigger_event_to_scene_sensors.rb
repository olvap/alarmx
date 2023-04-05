class AddTriggerEventToSceneSensors < ActiveRecord::Migration[7.0]
  def change
    add_column :scene_sensors, :trigger_event, :boolean
  end
end
