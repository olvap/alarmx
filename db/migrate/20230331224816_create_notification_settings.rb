class CreateNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :notification_settings do |t|
      t.boolean :active
      t.time :start_time
      t.time :end_time
      t.integer :cooldown

      t.timestamps
    end

  end
end
