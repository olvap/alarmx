module Api
  class SensorsController < ApplicationController
    include ApiKeyAuthenticatable
    protect_from_forgery with: :null_session

    prepend_before_action :authenticate_with_api_key!, only: [:show]

    def show
      render json: sensor
    end

    def update
      if sensor.update(sensor_params)
        ActionCable.server.broadcast("room_channel_12", { message: sensor.state.to_s })

        render json: sensor, status: :ok
      else
        render json: { errors: @sensor.errors.full_messages }, status: :unprocessable_entity
      end

    end

    private

    def sensor
      @sensor = Sensor.find(params[:id])
    end

    def sensor_params
      params.require(:sensor).permit(:name, :state)
    end
  end
end
