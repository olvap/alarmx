class DropSceneAndSceneSensors < ActiveRecord::Migration[7.0]
  def change
    drop_table :scene_sensors
    drop_table :scenes
  end
end
