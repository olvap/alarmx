class CreateSensors < ActiveRecord::Migration[7.0]
  def change
    create_table :sensors do |t|
      t.references :building, null: false, foreign_key: true
      t.boolean :state

      t.timestamps
    end
  end
end
