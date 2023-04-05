class Sensor < ApplicationRecord
  belongs_to :user
  belongs_to :notification_setting
  has_many :event_conditions, dependent: :restrict_with_exception

  after_initialize :set_defaults
  after_update :check_event_conditions
  before_destroy :check_for_related_event_conditions

  def triggers
    event_conditions.where(state: state, trigger: true)
  end

  private

  def check_for_related_event_conditions
    if event_conditions.exists?
      errors.add(:base, "No puedes eliminar un Sensor que tiene EventConditions relacionados")
      throw :abort
    end
  end

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
