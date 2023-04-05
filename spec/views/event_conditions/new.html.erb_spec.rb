require 'rails_helper'

RSpec.describe "event_conditions/new", type: :view do
  let(:user) { create :user }
  let(:event) { create :event, user: user }
  let(:sensor) { create :sensor, user: user }
  let(:event_condition) { create :event_condition, event: event, sensor: sensor }

  before(:each) do
    assign(:event_condition, event_condition)
  end

  it "renders new event_condition form" do
    # render
    #
    # assert_select "form[action=?][method=?]", event_conditions_path, "post" do
    #
    #   assert_select "input[name=?]", "event_condition[sensor_id]"
    #
    #   assert_select "input[name=?]", "event_condition[event_id]"
    #
    #   assert_select "input[name=?]", "event_condition[state]"
    #
    #   assert_select "input[name=?]", "event_condition[trigger]"
    # end
  end
end
