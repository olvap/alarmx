class EmittersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_emitter, only: %i[ show edit update destroy ]
  before_action :set_building, only: %i[ show edit update destroy new create ]

  # GET /emitters or /emitters.json
  def index
    @emitters = current_user.emitters
  end

  # GET /emitters/1 or /emitters/1.json
  def show
  end

  # GET /emitters/new
  def new
    @emitter = Emitter.new
  end

  # GET /emitters/1/edit
  def edit
  end

  # POST /emitters or /emitters.json
  def create
    @emitter = @building.emitters.new(emitter_params)

    respond_to do |format|
      if @emitter.save
        format.html { redirect_to building_emitter_url(@building, @emitter), notice: "Emitter was successfully created." }
        format.json { render :show, status: :created, location: @emitter }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @emitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emitters/1 or /emitters/1.json
  def update
    respond_to do |format|
      if @emitter.update(emitter_params)
        format.html { redirect_to building_emitter_url(@building, @emitter), notice: "Emitter was successfully updated." }
        format.json { render :show, status: :ok, location: @emitter }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @emitter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emitters/1 or /emitters/1.json
  def destroy
    @emitter.destroy

    respond_to do |format|
      format.html { redirect_to building_emitters_url(@building), notice: "Emitter was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_building
    @building = current_user.buildings.find(params[:building_id])
  end

  def set_emitter
    @emitter = Emitter.find(params[:id])
  end

  def emitter_params
    params.require(:emitter).permit(:name)
  end
end
