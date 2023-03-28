class PagesController < ApplicationController
  def home
    if current_user
      # redirect_to buildings_path
    end
  end
end
