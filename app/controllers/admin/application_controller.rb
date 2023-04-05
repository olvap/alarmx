class Admin::ApplicationController < ApplicationController
  before_action :require_admin
  before_action :set_resource, only: [:show, :edit, :update, :destroy]

  layout 'admin'

  def index
    instance_variable_set(collection_variable_name, model.all)
  end

  def new
    instance_variable_set(resource_variable_name, model.new)
  end

  def create
    @resource = instance_variable_set(
      resource_variable_name,
      model.new(admin_resource_params)
    )

    respond_to do |format|
      if @resource.save
        format.html { redirect_to polymorphic_url([:admin, @resource]), notice: "#{model} was successfully created." }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    binding.pry
    @resource = instance_variable_set(
      resource_variable_name,
      model.new(admin_resource_params)
    )
    respond_to do |format|
      if @resource.update(admin_resource_params)
        format.html {
          redirect_to polymorphic_url([:admin, @resource]), notice: "#{model}  successfully updated."
        }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @resource = instance_variable_set(
      resource_variable_name,
      model.new(admin_resource_params)
    )
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to polymorphic_url([:admin, @resource]), notice: "#{model} was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def require_admin
    unless current_user && current_user.admin?
      redirect_to root_path, alert: "You must be an admin to access this page."
    end
  end

  def model
    controller_name.classify.constantize
  end

  def resource
    model.find(params[:id])
  end

  def set_admin_resource
    @resource = model.find(params[:id])
  end

  def resource_variable_name
    "@#{controller_name.singularize}"
  end

  def collection_variable_name
    "@#{controller_name.pluralize}"
  end

  def set_resource
    instance_variable_set(resource_variable_name, resource)
  end
end
