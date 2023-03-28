require 'rails_helper'

RSpec.describe "buildings/show", type: :view do
  let(:user) { building.user }
  let(:building) {
    FactoryBot.create(:building)
  }
  before(:each) do
    assign(:building, building)
    assign(:sensors, [])
    sign_in user
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
