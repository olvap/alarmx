class Admin::ApiCredentialsController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:api_credential).permit(:token)
  end
end
