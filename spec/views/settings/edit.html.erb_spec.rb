require 'rails_helper'

RSpec.describe "settings/edit", type: :view do
  let(:setting) { create(:setting) }

  before(:each) do
    assign(:setting, setting)
  end

  it "renders the edit setting form" do
    # render
    #
    # assert_select "form[action=?][method=?]", setting_path(setting), "post" do
    #
    #   assert_select "input[name=?]", "setting[user_id]"
    #
    #   assert_select "input[name=?]", "setting[chat_id]"
    # end
  end
end
