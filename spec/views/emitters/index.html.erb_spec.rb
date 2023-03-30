require 'rails_helper'

RSpec.describe "emitters/index", type: :view do
  let(:building) { create(:building) }
  let(:emitters) { create_list(:emitter, 2, building: building) }
  before(:each) do
    assign(:emitters, emitters)
  end

  it "renders a list of emitters" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Token".to_s), count: 2
  end
end
