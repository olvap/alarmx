class PagesController < ApplicationController
  def home
    if current_user
      redirect_to sensors_path
    end
  end
end
