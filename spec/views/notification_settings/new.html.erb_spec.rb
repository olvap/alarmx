require 'rails_helper'

RSpec.describe "notification_settings/new", type: :view do
  before(:each) do
    assign(:notification_setting, NotificationSetting.new(
      chat_id: "MyString",
      message: "MyString"
    ))
  end

  it "renders new notification_setting form" do
    # render

    # assert_select "form[action=?][method=?]", notification_settings_path, "post" do
    #
    #   assert_select "input[name=?]", "notification_setting[chat_id]"
    #
    #   assert_select "input[name=?]", "notification_setting[message]"
    # end
  end
end
