class Admin::BuildingsController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:building).permit(:name, :user_id)
  end
end
