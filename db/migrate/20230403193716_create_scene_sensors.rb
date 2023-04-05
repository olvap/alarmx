class CreateSceneSensors < ActiveRecord::Migration[7.0]
  def change
    create_table :scene_sensors do |t|
      t.references :sensor, null: false, foreign_key: true
      t.references :scene, null: false, foreign_key: true

      t.timestamps
    end
  end
end
