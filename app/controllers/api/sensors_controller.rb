module Api
  class SensorsController < ApplicationController
    protect_from_forgery with: :null_session
    include ApiKeyAuthenticatable

    prepend_before_action :authenticate_with_api_key!

    def show
      render json: sensor
    end

    def update
      if sensor.update(sensor_params)
        SensorUpdateService.new(sensor).update

        render json: sensor, status: :ok
      else
        render json: { errors: @sensor.errors.full_messages }, status: :unprocessable_entity
      end
    end

    private

    def sensor
      @sensor ||= current_bearer.sensors.find(params[:id])
    end

    def create_sensor_params
      params.require(:sensor).permit(:mac)
    end

    def sensor_params
      params.require(:sensor).permit(:name, :state)
    end
  end
end
