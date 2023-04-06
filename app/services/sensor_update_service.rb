class SensorUpdateService
  def initialize(sensor)
    self.sensor = sensor
  end

  def update
    return unless sensor.previous_changes.include? 'state'
    action_cable
    return if sensor.triggers.empty?
    sensor.triggers.map(&:event).map { |event| perform(event) }
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

  def perform(event)
    return unless event.all_conditions_checked?

    TelegramService.new.send_notification(
      event.notification_setting.chat_id,
      event.notification_setting.message
    )
  end
end
