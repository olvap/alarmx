require 'rails_helper'

RSpec.describe "event_conditions/edit", type: :view do
  let(:user) { create :user }
  let(:event) { create :event, user: user }
  let(:sensor) { create :sensor, user: user }
  let(:event_condition) { create :event_condition, event: event, sensor: sensor }

  before(:each) do
    assign(:event_condition, event_condition)
  end

  it "renders the edit event_condition form" do
    # render
    #
    # assert_select "form[action=?][method=?]", event_condition_path(event_condition), "post" do
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
