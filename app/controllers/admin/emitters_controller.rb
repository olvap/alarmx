class Admin::EmittersController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:emitter).permit(:name, :token, :building_id)
  end
end
