class CreateEventConditions < ActiveRecord::Migration[7.0]
  def change
    create_table :event_conditions do |t|
      t.references :event, null: false, foreign_key: true
      t.references :sensor, null: false, foreign_key: true
      t.boolean :state
      t.boolean :trigger

      t.timestamps
    end
  end
end
