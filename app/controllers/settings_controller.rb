class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_setting, only: %i[ show edit update destroy ]

  # GET /settings/1 or /settings/1.json
  def show
  end

  # GET /settings/1/edit
  def edit
  end

  # PATCH/PUT /settings/1 or /settings/1.json
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to setting_url(@setting), notice: "Setting was successfully updated." }
        format.json { render :show, status: :ok, location: @setting }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1 or /settings/1.json
  def destroy
    @setting.destroy

    respond_to do |format|
      format.html { redirect_to setting_url, notice: "Setting was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = current_user.setting
    end

    # Only allow a list of trusted parameters through.
    def setting_params
      params.require(:setting).permit(:chat_id)
    end
end
