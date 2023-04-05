class SensorsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sensor, only: %i[ show edit update destroy ]

  def index
    @sensors = current_user.sensors
  end

  def show
  end

  def new
    @sensor = Sensor.new
  end

  def edit
  end

  def create
    @sensor = current_user.sensors.new(sensor_params)

    respond_to do |format|
      if @sensor.save
        format.html { redirect_to sensor_url(@sensor), notice: "Sensor was successfully created." }
        format.json { render :show, status: :created, location: @sensor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sensor.update(sensor_params)
        format.html { redirect_to sensor_url(@sensor), notice: "Sensor was successfully updated." }
        format.json { render :show, status: :ok, location: @sensor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sensor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    begin
      @sensor.destroy

      respond_to do |format|
        format.html { redirect_to sensors_url, notice: "Sensor was successfully destroyed." }
        format.json { head :no_content }
      end

    rescue ActiveRecord::DeleteRestrictionError
      redirect_to sensors_path, alert: "No puedes eliminar un Sensor que tiene EventConditions relacionados"
    end
  end

  private

  def set_sensor
    @sensor = current_user.sensors.find(params[:id])
  end

  def sensor_params
    params.require(:sensor).permit(:name, :state, :mac)
  end
end
