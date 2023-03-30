require 'rails_helper'

RSpec.describe "emitters/new", type: :view do
  before(:each) do
    assign(:emitter, Emitter.new(
      name: "MyString",
      token: "MyString"
    ))
  end

  it "renders new emitter form" do
    render

    assert_select "form[action=?][method=?]", emitters_path, "post" do

      assert_select "input[name=?]", "emitter[name]"

      assert_select "input[name=?]", "emitter[token]"
    end
  end
end
