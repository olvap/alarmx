require 'rails_helper'

RSpec.describe "settings/show", type: :view do
  let(:setting) { create(:setting) }

  before(:each) do
    assign(:setting, setting)
  end

  it "renders attributes in <p>" do
    # render
    # expect(rendered).to match(//)
    # expect(rendered).to match(/2/)
  end
end
