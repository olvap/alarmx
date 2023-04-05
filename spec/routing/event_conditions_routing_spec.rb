require "rails_helper"

RSpec.describe EventConditionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/event_conditions").to route_to("event_conditions#index")
    end

    it "routes to #new" do
      expect(get: "/event_conditions/new").to route_to("event_conditions#new")
    end

    it "routes to #show" do
      expect(get: "/event_conditions/1").to route_to("event_conditions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/event_conditions/1/edit").to route_to("event_conditions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/event_conditions").to route_to("event_conditions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/event_conditions/1").to route_to("event_conditions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/event_conditions/1").to route_to("event_conditions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/event_conditions/1").to route_to("event_conditions#destroy", id: "1")
    end
  end
end
