class Admin::UsersController < Admin::ApplicationController

  private

  def admin_resource_params
    params.require(:user).permit(:email)
  end
end
