require 'rails_helper'

RSpec.describe "emitters/edit", type: :view do
  let(:emitter) { create(:emitter) }

  before(:each) do
    assign(:emitter, emitter)
  end

  it "renders the edit emitter form" do
    render

    assert_select "form[action=?][method=?]", emitter_path(emitter), "post" do

      assert_select "input[name=?]", "emitter[name]"

      assert_select "input[name=?]", "emitter[token]"
    end
  end
end
