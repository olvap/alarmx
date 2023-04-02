class AddLastSendToNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :notification_settings, :last_send_at, :datetime
  end
end
