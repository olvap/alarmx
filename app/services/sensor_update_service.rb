class SensorUpdateService
  def initialize(sensor)
    self.sensor = sensor
  end

  def update
    return unless sensor.previous_changes.include? 'state'
    action_cable
    send_notifications
  end

  private

  attr_accessor :sensor

  def action_cable
    ActionCable.server.broadcast(
      "sensor_channel_#{sensor.id}",
      { message: sensor.state.to_s }
    )
    ActionCable.server.broadcast 'sensor_channel', {sensor: sensor }
  end

  def telegram_service
    @telegram_service ||= TelegramService.new
  end

  def send_notifications
    events_to_notify =
      Event.joins(:event_conditions)
      .where(
        event_conditions: {
          sensor_id: @sensor.id,
          state: @sensor.state,
          trigger: true
        }
      )

    events_to_notify.each do |event|
      next unless event.all_conditions_checked?

      telegram_service.send_notification(
        event.notification_setting.chat_id,
        event.notification_setting.message
      )
    end
  end
end
