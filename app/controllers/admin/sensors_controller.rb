class Admin::SensorsController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:sensor).permit(:name, :emitter_id, :state)
  end
end
