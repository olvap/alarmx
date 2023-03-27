require 'rails_helper'

RSpec.describe "buildings/edit", type: :view do
  let(:user) { building.user }
  let(:building) {
    FactoryBot.create(:building)
  }

  before(:each) do
    assign(:building, building)
    sign_in user
  end

  it "renders the edit building form" do
    render

    assert_select "form[action=?][method=?]", building_path(building), "post" do

      assert_select "input[name=?]", "building[name]"
    end
  end
end
