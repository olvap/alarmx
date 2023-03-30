require 'rails_helper'

RSpec.describe "emitters/edit", type: :view do
  let(:building) { emitter.building }
  let(:emitter) { create(:emitter) }

  before(:each) do
    assign(:emitter, emitter)
    assign(:building, building)
  end

  it "renders the edit emitter form" do
    render

    assert_select "form[action=?][method=?]", building_emitter_path(building, emitter), "post" do
      assert_select "input[name=?]", "emitter[name]"
    end
  end
end
