class Admin::BuildingsController < Admin::ApplicationController

  private

  def admin_building_params
    params.require(:building).permit(:name, :user_id)
  end
end
