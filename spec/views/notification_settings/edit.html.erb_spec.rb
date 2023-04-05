require 'rails_helper'

RSpec.describe "notification_settings/edit", type: :view do
  let(:notification_setting) {
    NotificationSetting.create!(
      chat_id: "MyString",
      message: "MyString"
    )
  }

  before(:each) do
    assign(:notification_setting, notification_setting)
  end

  it "renders the edit notification_setting form" do
    # render
    #
    # assert_select "form[action=?][method=?]", notification_setting_path(notification_setting), "post" do
    #
    #   assert_select "input[name=?]", "notification_setting[chat_id]"
    #
    #   assert_select "input[name=?]", "notification_setting[message]"
    # end
  end
end
