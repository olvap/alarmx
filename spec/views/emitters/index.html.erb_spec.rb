require 'rails_helper'

RSpec.describe "emitters/index", type: :view do
  let(:building) { create(:building) }
  let(:emitters) { create_list(:emitter, 2, building: building) }
  before(:each) do
    assign(:emitters, emitters)
    assign(:building, building)
  end

  it "renders a list of emitters" do
    render
    cell_selector = 'ul>li'
    name = emitters.first.name
    assert_select cell_selector, text: Regexp.new(name), count: 2
  end
end
