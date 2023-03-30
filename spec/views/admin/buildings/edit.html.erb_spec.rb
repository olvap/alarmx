require 'rails_helper'

RSpec.describe "admin/buildings/edit", type: :view do
  let(:admin_building) {
    Admin::Building.create!(
      name: "MyString",
      user: nil
    )
  }

  before(:each) do
    assign(:admin_building, admin_building)
  end

  it "renders the edit admin_building form" do
    render

    assert_select "form[action=?][method=?]", admin_building_path(admin_building), "post" do

      assert_select "input[name=?]", "admin_building[name]"

      assert_select "input[name=?]", "admin_building[user_id]"
    end
  end
end
