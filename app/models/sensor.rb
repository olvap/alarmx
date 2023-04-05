class Sensor < ApplicationRecord
  belongs_to :user
  belongs_to :notification_setting
  has_many :event_conditions

  after_initialize :set_defaults
  after_update :check_event_conditions

  def triggers
    event_conditions.where(state: state, trigger: true)
  end

  private

  def set_defaults
    self.notification_setting ||= NotificationSetting.create
  end

  def check_event_conditions
    return unless previous_changes.include? 'state'
    action_cable

    triggers.map(&:event).map(&:perform) unless triggers.empty?
  end

  def action_cable
    ActionCable.server.broadcast(
      "sensor_channel_#{id}",
      { message: state.to_s }
    )
    ActionCable.server.broadcast 'sensor_channel', {sensor: self }
  end
end
