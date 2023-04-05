module Api
  class EmittersController < ApplicationController
    protect_from_forgery with: :null_session
    include ApiKeyAuthenticatable

    prepend_before_action :authenticate_with_api_key!

    def update
      mac = "#{params[:emitter_mac]}-#{params[:pin]}"

      sensor = current_bearer.sensors.find_or_create_by(
        mac: mac
      )

      if sensor.update(sensor_params)

        render json: sensor, status: :ok
      else
        render json: { errors: @emitter.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def sensor_params
      params.require(:sensor).permit(:state)
    end
  end
end
