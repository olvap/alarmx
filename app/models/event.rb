class Event < ApplicationRecord
  belongs_to :user
  belongs_to :notification_setting
  has_many :event_conditions
  has_many :sensors, through: :event_conditions

  after_initialize :create_setting

  def all_conditions_checked?
    event_conditions.where(
      "NOT EXISTS (
         SELECT 1 FROM sensors
         WHERE sensors.id = event_conditions.sensor_id
         AND sensors.state <> event_conditions.state
         AND sensors.user_id = ?
       )", user_id
    ).count == event_conditions.count
  end

  private

  def create_setting
    self.notification_setting ||= NotificationSetting.find_or_initialize_by(event: self)
  end
end
