json.extract! notification_setting, :id, :event_id, :chat_id, :message, :created_at, :updated_at
json.url notification_setting_url(notification_setting, format: :json)
