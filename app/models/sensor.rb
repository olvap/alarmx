class Sensor < ApplicationRecord
  belongs_to :user
  has_many :event_conditions, dependent: :restrict_with_exception, counter_cache: true
  has_many :triggers, ->(sensor) { where(state: sensor.state, trigger: true) }, class_name: "EventCondition"

  before_destroy :check_for_related_event_conditions

  private

  def check_for_related_event_conditions
    if event_conditions.exists?
      errors.add(:base, "No puedes eliminar un Sensor que tiene EventConditions relacionados")
      throw :abort
    end
  end
end
