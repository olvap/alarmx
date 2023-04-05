class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user
      sensors_path
    end
  end
end
