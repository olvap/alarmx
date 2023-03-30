require "rails_helper"

RSpec.describe SettingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/setting").to route_to("settings#show")
    end

    it "routes to #show" do
      expect(get: "/setting").to route_to("settings#show")
    end

    it "routes to #edit" do
      expect(get: "/setting/edit").to route_to("settings#edit")
    end


    it "routes to #update via PUT" do
      expect(put: "/setting").to route_to("settings#update")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/setting").to route_to("settings#update")
    end

    it "routes to #destroy" do
      expect(delete: "/setting").to route_to("settings#destroy")
    end
  end
end
