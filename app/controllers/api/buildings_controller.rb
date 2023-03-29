module Api
  class BuildingsController < ApplicationController
    protect_from_forgery with: :null_session
    include ApiKeyAuthenticatable

    prepend_before_action :authenticate_with_api_key!

    def index
      render json: current_bearer.buildings
    end

    def show
      render json: building, include: :sensors
    end

    private

    def building
      @building = current_bearer.buildings.includes(:sensors).find(params[:id])
    end
  end
end
