class Sensor < ApplicationRecord
  belongs_to :user
  belongs_to :notification_setting
  has_many :event_conditions, dependent: :restrict_with_exception, counter_cache: true
  has_many :triggers, ->(sensor) { where(state: sensor.state, trigger: true) }, class_name: "EventCondition"

  after_initialize :set_defaults
  before_destroy :check_for_related_event_conditions

  private

  def check_for_related_event_conditions
    if event_conditions.exists?
      errors.add(:base, "No puedes eliminar un Sensor que tiene EventConditions relacionados")
      throw :abort
    end
  end

  def set_defaults
    self.notification_setting ||= NotificationSetting.find_or_initialize_by(sensor: self)
  end
end
