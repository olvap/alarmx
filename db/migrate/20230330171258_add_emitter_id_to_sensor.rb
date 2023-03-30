class AddEmitterIdToSensor < ActiveRecord::Migration[7.0]
  def change
    add_reference :sensors, :emitter, null: true, foreign_key: true
  end
end
