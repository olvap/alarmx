require 'rails_helper'

RSpec.describe "admin/buildings/new", type: :view do
  before(:each) do
    assign(:admin_building, Admin::Building.new(
      name: "MyString",
      user: nil
    ))
  end

  it "renders new admin_building form" do
    render

    assert_select "form[action=?][method=?]", admin_buildings_path, "post" do

      assert_select "input[name=?]", "admin_building[name]"

      assert_select "input[name=?]", "admin_building[user_id]"
    end
  end
end
