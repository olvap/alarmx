module Api
  class EmittersController < ApplicationController
    protect_from_forgery with: :null_session
    include ApiKeyAuthenticatable

    prepend_before_action :authenticate_with_api_key!

    def create
      default_building = current_bearer.buildings.first
      @emitter = default_building.emitters.new(emitter_params)

      if @emitter.save
        render json: @emitter, status: :created
      else
        render json: @emitter.errors, status: :unprocessable_entity
      end

    end

    def sensor_update
      sensor = emitter.sensors.find_or_create_by(pin: params[:pin])


      if sensor.update(update_state_params)
        action_cable(sensor)

        render json: sensor, status: :ok
      else
        render json: { errors: @emitter.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def emitter
      @emitter = Emitter.find_or_create_by(token: params[:emitter_token])
    end

    def emitter_params
      params.require(:emitter).permit(:name)
    end

    def update_state_params
      params.require(:sensor).permit(:state)
    end

    def action_cable(sensor)
        ActionCable.server.broadcast(
          "sensor_channel_#{sensor.id}",
          { message: sensor.state.to_s }
        )
        ActionCable.server.broadcast 'sensor_channel', {sensor: sensor }
    end
  end
end
