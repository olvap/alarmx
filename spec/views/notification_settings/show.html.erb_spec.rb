require 'rails_helper'

RSpec.describe "notification_settings/show", type: :view do
  before(:each) do
    assign(:notification_setting, NotificationSetting.create!(
      chat_id: "Chat",
      message: "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Chat/)
    expect(rendered).to match(/Message/)
  end
end
