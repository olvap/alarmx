require 'rails_helper'

RSpec.describe "emitters/new", type: :view do
  let(:building) { create(:building) }
  let(:emitter) { building.emitters.new }
  before(:each) do
    assign(:emitter, emitter)
    assign(:building, building)
  end

  it "renders new emitter form" do
    render

    assert_select "form[action=?][method=?]", building_emitters_path(building), "post" do

      assert_select "input[name=?]", "emitter[name]"
    end
  end
end
