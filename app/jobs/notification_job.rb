class NotificationJob < ApplicationJob
  queue_as :default

  def perform(sensor)
    return unless sensor.notification_setting.active

    user = sensor.emitter.building.user
    TelegramService.new.call(
      user.setting.chat_id,
      "Sensor: #{sensor.name} State: #{sensor.state}"
    )
  end
end
