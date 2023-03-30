require "rails_helper"

RSpec.describe "Emitters routing", type: :routing do
  it "routes to emitters#index" do
    expect(get: "/buildings/1/emitters").to route_to("emitters#index", building_id: "1")
  end

  it "routes to emitters#show" do
    expect(get: "/buildings/1/emitters/1").to route_to("emitters#show", building_id: "1", id: "1")
  end

  it "routes to emitters#new" do
    expect(get: "/buildings/1/emitters/new").to route_to("emitters#new", building_id: "1")
  end

  it "routes to emitters#create" do
    expect(post: "/buildings/1/emitters").to route_to("emitters#create", building_id: "1")
  end

  it "routes to emitters#edit" do
    expect(get: "/buildings/1/emitters/1/edit").to route_to("emitters#edit", building_id: "1", id: "1")
  end

  it "routes to emitters#update" do
    expect(patch: "/buildings/1/emitters/1").to route_to("emitters#update", building_id: "1", id: "1")
  end

  it "routes to emitters#destroy" do
    expect(delete: "/buildings/1/emitters/1").to route_to("emitters#destroy", building_id: "1", id: "1")
  end
end
