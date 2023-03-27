class SensorsController < ApplicationController
  before_action :set_sensor, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  private
  def set_sensor
    @sensor = current_user.sensors.find(params[:id])
  end
end
