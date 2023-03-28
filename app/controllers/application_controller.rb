class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_user
      buildings_path
    end
  end
end
