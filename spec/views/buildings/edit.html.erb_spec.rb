require 'rails_helper'

RSpec.describe "buildings/edit", type: :view do
  let(:building) {
    Building.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:building, building)
  end

  it "renders the edit building form" do
    render

    assert_select "form[action=?][method=?]", building_path(building), "post" do

      assert_select "input[name=?]", "building[name]"
    end
  end
end
