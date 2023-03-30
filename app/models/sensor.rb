class Sensor < ApplicationRecord
  belongs_to :building, optional: true
  belongs_to :emitter, optional: true
  belongs_to :user, optional: true

  after_initialize :set_default_building

  private

  def set_default_building
    self.building ||= user&.buildings&.first
  end
end
