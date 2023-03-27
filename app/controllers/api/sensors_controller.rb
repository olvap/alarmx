module Api
  class SensorsController < ApplicationController
    include ApiKeyAuthenticatable
    protect_from_forgery with: :null_session

    prepend_before_action :authenticate_with_api_key!

    def show
      render json: sensor
    end

    def create
      @sensor = current_bearer.sensors.new(create_sensor_params)

        if @sensor.save
          render json: @sensor, status: :created
        else
          render json: @sensor.errors, status: :unprocessable_entity
      end

    end

    def update
      if sensor.update(sensor_params)
        ActionCable.server.broadcast(
          "Sensor_#{sensor.id}",
          { message: sensor.state.to_s }
        )

        render json: sensor, status: :ok
      else
        render json: { errors: @sensor.errors.full_messages }, status: :unprocessable_entity
      end

    end

    private

    def sensor
      @sensor = current_bearer.sensors.find(params[:id])
    end

    def create_sensor_params
      params.require(:sensor).permit(:mac)
    end

    def sensor_params
      params.require(:sensor).permit(:name, :state)
    end
  end
end
