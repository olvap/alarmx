class SensorChannel < ApplicationCable::Channel
  def subscribed
    if params[:id]
      stream_from "sensor_channel_#{params[:id]}" if params[:id]
    else
      stream_from 'sensor_channel'
    end
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak
    puts params
    if params[:id]
      ActionCable.server.broadcast "sensor_channel_#{params[:id]}", message: data['message']
    else
      ActionCable.server.broadcast 'sensor_channel', message: data['message']
    end
  end
end
