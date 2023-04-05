class NotificationSettingsController < ApplicationController
  before_action :set_notification_setting, only: %i[ show edit update destroy ]

  # GET /notification_settings or /notification_settings.json
  def index
    @notification_settings = NotificationSetting.all
  end

  # GET /notification_settings/1 or /notification_settings/1.json
  def show
  end

  # GET /notification_settings/new
  def new
    @notification_setting = NotificationSetting.new
  end

  # GET /notification_settings/1/edit
  def edit
  end

  # POST /notification_settings or /notification_settings.json
  def create
    @notification_setting = NotificationSetting.new(notification_setting_params)

    respond_to do |format|
      if @notification_setting.save
        format.html { redirect_to notification_setting_url(@notification_setting), notice: "Notification setting was successfully created." }
        format.json { render :show, status: :created, location: @notification_setting }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @notification_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notification_settings/1 or /notification_settings/1.json
  def update
    respond_to do |format|
      if @notification_setting.update(notification_setting_params)
        format.html { redirect_to notification_setting_url(@notification_setting), notice: "Notification setting was successfully updated." }
        format.json { render :show, status: :ok, location: @notification_setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @notification_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notification_settings/1 or /notification_settings/1.json
  def destroy
    @notification_setting.destroy

    respond_to do |format|
      format.html { redirect_to notification_settings_url, notice: "Notification setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification_setting
      @notification_setting = NotificationSetting.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_setting_params
      params.require(:notification_setting).permit(:event_id, :chat_id, :message)
    end
end
