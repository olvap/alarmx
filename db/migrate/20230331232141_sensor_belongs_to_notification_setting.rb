class SensorBelongsToNotificationSetting < ActiveRecord::Migration[7.0]
  def change
    add_reference :sensors, :notification_setting, null: true, foreign_key: true
  end
end
