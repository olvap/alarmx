class Sensor < ApplicationRecord
  validates :mac, presence: true

  belongs_to :building, optional: true
  belongs_to :user, optional: true

  after_initialize :set_default_building

  private

  def set_default_building
    self.building ||= user&.buildings&.first
  end
end
