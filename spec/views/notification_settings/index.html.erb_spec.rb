require 'rails_helper'

RSpec.describe "notification_settings/index", type: :view do
  before(:each) do
    assign(:notification_settings, [
      NotificationSetting.create!(
        chat_id: "Chat",
        message: "Message"
      ),
      NotificationSetting.create!(
        chat_id: "Chat",
        message: "Message"
      )
    ])
  end

  it "renders a list of notification_settings" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Chat".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Message".to_s), count: 2
  end
end
