module Api
  class EmittersController < ApplicationController
    protect_from_forgery with: :null_session
    include ApiKeyAuthenticatable

    # prepend_before_action :authenticate_with_api_key!

    def update
      mac = "#{params[:emitter_mac]}-#{params[:pin]}"

      current_bearer = User.first
      sensor = current_bearer.sensors.find_or_create_by(
        mac: mac
      )

      if sensor.update(sensor_params)
        SensorUpdateService.new(sensor).update
        render json: sensor, status: :ok
      end
    end

    def update_temp
      mac = "#{params[:emitter_mac]}-#{params[:pin]}"
      token = params[:token]
      user = ApiCredential.find_by(token: token).user
      sensor = user.sensors.find_or_create_by(mac: mac)
      if sensor.update(state: params[:state])
        render json: sensor, status: :ok
      end
    end

    private

    def sensor_params
      params.require(:sensor).permit(:state, :pin)
    end
  end
end
