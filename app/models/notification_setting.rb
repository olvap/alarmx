class NotificationSetting < ApplicationRecord
  has_one :sensor

  delegate :user, to: :sensor

  def send_notification?(current_time)
    active
  end

  def mark_notification_sent(current_time)
    update(last_send_at: current_time)
  end
end
