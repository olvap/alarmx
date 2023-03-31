class Admin::SettingsController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:sensor).permit(:user_id, :chat_id)
  end
end
