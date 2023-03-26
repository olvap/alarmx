module Api
  class SensorsController < ApplicationController
    def show
      @sensor = Sensor.find(params[:id])
      render json: @sensor
    end
  end
end
