require 'rails_helper'

RSpec.describe "buildings/index", type: :view do
  let!(:user) { FactoryBot.create(:user) }
  before { sign_in user }
  before(:each) do
    assign(:buildings, [
      Building.create!(
        user: user,
        name: "Name"
      ),
      Building.create!(
        user: user,
        name: "Name"
      )
    ])
  end

  it "renders a list of buildings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  end
end
