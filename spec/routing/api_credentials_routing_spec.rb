require "rails_helper"

RSpec.describe ApiCredentialsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api_credentials").to route_to("api_credentials#index")
    end

    it "routes to #new" do
      expect(get: "/api_credentials/new").to route_to("api_credentials#new")
    end

    it "routes to #show" do
      expect(get: "/api_credentials/1").to route_to("api_credentials#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/api_credentials").to route_to("api_credentials#create")
    end

    it "routes to #destroy" do
      expect(delete: "/api_credentials/1").to route_to("api_credentials#destroy", id: "1")
    end
  end
end
