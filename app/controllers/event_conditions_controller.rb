class EventConditionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event_condition, only: %i[ show edit update destroy ]
  before_action :set_event, only: %i[ new create ]

  # GET /event_conditions or /event_conditions.json
  def index
    @event_conditions = EventCondition.all
  end

  # GET /event_conditions/1 or /event_conditions/1.json
  def show
  end

  # GET /event_conditions/new
  def new
    @event_condition = EventCondition.new
  end

  # GET /event_conditions/1/edit
  def edit
  end

  # POST /event_conditions or /event_conditions.json
  def create
    @event_condition = @event.event_conditions.new(event_condition_params)

    respond_to do |format|
      if @event_condition.save
        format.html { redirect_to event_condition_url(@event_condition), notice: "EventCondition was successfully created." }
        format.json { render :show, status: :created, location: @event_condition }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_conditions/1 or /event_conditions/1.json
  def update
    respond_to do |format|
      if @event_condition.update(event_condition_params)
        format.html { redirect_to event_condition_url(@event_condition), notice: "EventCondition was successfully updated." }
        format.json { render :show, status: :ok, location: @event_condition }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event_condition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_conditions/1 or /event_conditions/1.json
  def destroy
    @event_condition.destroy

    respond_to do |format|
      format.html { redirect_to event_conditions_url, notice: "EventCondition was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_event
      @event = current_user.events.find(params[:event_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_event_condition
      @event_condition = EventCondition.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_condition_params
      params.require(:event_condition).permit(:state, :sensor_id, :trigger)
    end
end
