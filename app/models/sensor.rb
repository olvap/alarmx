class Sensor < ApplicationRecord
  belongs_to :emitter
  belongs_to :notification_setting

  after_initialize :set_defaults

  delegate :user, :building, to: :emitter

  private

  def set_defaults
    self.notification_setting ||= NotificationSetting.create
  end
end
