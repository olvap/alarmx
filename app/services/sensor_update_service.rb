class SensorUpdateService
  def initialize(sensor)
    self.sensor = sensor
  end

  def update
    return unless sensor.previous_changes.include? 'state'
    action_cable
    sensor.triggers.map(&:event).map(&:perform) unless sensor.triggers.empty?
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
end
