require "rails_helper"

RSpec.describe EmittersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/emitters").to route_to("emitters#index")
    end

    it "routes to #new" do
      expect(get: "/emitters/new").to route_to("emitters#new")
    end

    it "routes to #show" do
      expect(get: "/emitters/1").to route_to("emitters#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/emitters/1/edit").to route_to("emitters#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/emitters").to route_to("emitters#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/emitters/1").to route_to("emitters#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/emitters/1").to route_to("emitters#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/emitters/1").to route_to("emitters#destroy", id: "1")
    end
  end
end
