class Event < ApplicationRecord
  belongs_to :user
  belongs_to :notification_setting
  has_many :event_conditions
  has_many :sensors, through: :event_conditions

  after_initialize :create_setting

  def all_conditions_checked?
    event_conditions.pluck(:sensor_id, :state) == sensors.pluck(:sensor_id, :state)
  end

  def perform
    return unless all_conditions_checked?

    TelegramService.new.send_notification(
      notification_setting.chat_id,
      notification_setting.message
    )
  end

  private

  def create_setting
    self.notification_setting ||= NotificationSetting.create
  end
end
