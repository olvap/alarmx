require 'rails_helper'

RSpec.describe "emitters/show", type: :view do
  let(:emitter) { create(:emitter) }
  before(:each) do
    assign(:emitter, emitter)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Token/)
  end
end
