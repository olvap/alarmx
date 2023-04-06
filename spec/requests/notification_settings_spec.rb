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

RSpec.describe "/notification_settings", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # NotificationSetting. As you add validations to NotificationSetting, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      NotificationSetting.create! valid_attributes
      get notification_settings_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      notification_setting = NotificationSetting.create! valid_attributes
      get notification_setting_url(notification_setting)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      skip
      get new_notification_setting_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      notification_setting = NotificationSetting.create! valid_attributes
      get edit_notification_setting_url(notification_setting)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new NotificationSetting" do
        expect {
          post notification_settings_url, params: { notification_setting: valid_attributes }
        }.to change(NotificationSetting, :count).by(1)
      end

      it "redirects to the created notification_setting" do
        post notification_settings_url, params: { notification_setting: valid_attributes }
        expect(response).to redirect_to(notification_setting_url(NotificationSetting.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new NotificationSetting" do
        expect {
          post notification_settings_url, params: { notification_setting: invalid_attributes }
        }.to change(NotificationSetting, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post notification_settings_url, params: { notification_setting: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested notification_setting" do
        notification_setting = NotificationSetting.create! valid_attributes
        patch notification_setting_url(notification_setting), params: { notification_setting: new_attributes }
        notification_setting.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the notification_setting" do
        notification_setting = NotificationSetting.create! valid_attributes
        patch notification_setting_url(notification_setting), params: { notification_setting: new_attributes }
        notification_setting.reload
        expect(response).to redirect_to(notification_setting_url(notification_setting))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        notification_setting = NotificationSetting.create! valid_attributes
        patch notification_setting_url(notification_setting), params: { notification_setting: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested notification_setting" do
      notification_setting = NotificationSetting.create! valid_attributes
      expect {
        delete notification_setting_url(notification_setting)
      }.to change(NotificationSetting, :count).by(-1)
    end

    it "redirects to the notification_settings list" do
      notification_setting = NotificationSetting.create! valid_attributes
      delete notification_setting_url(notification_setting)
      expect(response).to redirect_to(notification_settings_url)
    end
  end
end
