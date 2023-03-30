require 'rails_helper'

RSpec.describe "admin/buildings/index", type: :view do
  before(:each) do
    assign(:admin_buildings, [
      Admin::Building.create!(
        name: "Name",
        user: nil
      ),
      Admin::Building.create!(
        name: "Name",
        user: nil
      )
    ])
  end

  it "renders a list of admin/buildings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
