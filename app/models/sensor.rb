class Sensor < ApplicationRecord
  belongs_to :building, optional: true
  belongs_to :emitter, optional: true
  belongs_to :notification_setting

  after_initialize :set_defaults

  delegate :user, to: :emitter

  private

  def set_defaults
    self.building ||= emitter&.building
    self.notification_setting ||= NotificationSetting.create
  end
end
