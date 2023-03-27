class ApiCredentialsController < ApplicationController
  before_action :set_api_credential, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /api_credentials or /api_credentials.json
  def index
    @api_credentials = current_user.api_credentials
  end

  # GET /api_credentials/1 or /api_credentials/1.json
  def show
  end

  # GET /api_credentials/new
  def new
    @api_credential = ApiCredential.new
  end

  # GET /api_credentials/1/edit
  def edit
  end

  # POST /api_credentials or /api_credentials.json
  def create
    @api_credential = current_user.api_credentials.new(api_credential_params)

    respond_to do |format|
      if @api_credential.save
        format.html { redirect_to api_credential_url(@api_credential), notice: "Api credential was successfully created." }
        format.json { render :show, status: :created, location: @api_credential }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_credential.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api_credentials/1 or /api_credentials/1.json
  def destroy
    @api_credential.destroy

    respond_to do |format|
      format.html { redirect_to api_credentials_url, notice: "Api credential was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_credential
      @api_credential = current_user.api_credentials.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_credential_params
      params.fetch(:api_credential, {})
    end
end
