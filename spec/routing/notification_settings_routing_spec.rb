require "rails_helper"

RSpec.describe NotificationSettingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/notification_settings").to route_to("notification_settings#index")
    end

    it "routes to #new" do
      expect(get: "/notification_settings/new").to route_to("notification_settings#new")
    end

    it "routes to #show" do
      expect(get: "/notification_settings/1").to route_to("notification_settings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/notification_settings/1/edit").to route_to("notification_settings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/notification_settings").to route_to("notification_settings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/notification_settings/1").to route_to("notification_settings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/notification_settings/1").to route_to("notification_settings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/notification_settings/1").to route_to("notification_settings#destroy", id: "1")
    end
  end
end
