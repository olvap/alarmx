require 'rails_helper'

RSpec.describe "event_conditions/index", type: :view do
  let(:user) { create :user }
  let(:event) { create :event, user: user }
  let(:sensor) { create :sensor, user: user }
  let(:event_condition) { create :event_condition, event: event, sensor: sensor }

  before(:each) do
    assign(:event_conditions, [event_condition])
  end

  it "renders a list of event_conditions" do
    render
  end
end
