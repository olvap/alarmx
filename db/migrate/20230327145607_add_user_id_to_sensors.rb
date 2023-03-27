class AddUserIdToSensors < ActiveRecord::Migration[7.0]
  def change
    add_reference :sensors, :user, null: true, foreign_key: true
  end
end
