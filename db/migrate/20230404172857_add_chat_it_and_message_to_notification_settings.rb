class AddChatItAndMessageToNotificationSettings < ActiveRecord::Migration[7.0]
  def change
    add_column :notification_settings, :chat_id, :string
    add_column :notification_settings, :message, :string
  end
end
