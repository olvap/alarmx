require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin/buildings", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Admin::Building. As you add validations to Admin::Building, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Admin::Building.create! valid_attributes
      get admin_buildings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      building = Admin::Building.create! valid_attributes
      get admin_building_url(building)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_building_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      building = Admin::Building.create! valid_attributes
      get edit_admin_building_url(building)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Admin::Building" do
        expect {
          post admin_buildings_url, params: { admin_building: valid_attributes }
        }.to change(Admin::Building, :count).by(1)
      end

      it "redirects to the created admin_building" do
        post admin_buildings_url, params: { admin_building: valid_attributes }
        expect(response).to redirect_to(admin_building_url(Admin::Building.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Admin::Building" do
        expect {
          post admin_buildings_url, params: { admin_building: invalid_attributes }
        }.to change(Admin::Building, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post admin_buildings_url, params: { admin_building: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_building" do
        building = Admin::Building.create! valid_attributes
        patch admin_building_url(building), params: { admin_building: new_attributes }
        building.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the admin_building" do
        building = Admin::Building.create! valid_attributes
        patch admin_building_url(building), params: { admin_building: new_attributes }
        building.reload
        expect(response).to redirect_to(admin_building_url(building))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        building = Admin::Building.create! valid_attributes
        patch admin_building_url(building), params: { admin_building: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested admin_building" do
      building = Admin::Building.create! valid_attributes
      expect {
        delete admin_building_url(building)
      }.to change(Admin::Building, :count).by(-1)
    end

    it "redirects to the admin_buildings list" do
      building = Admin::Building.create! valid_attributes
      delete admin_building_url(building)
      expect(response).to redirect_to(admin_buildings_url)
    end
  end
end
