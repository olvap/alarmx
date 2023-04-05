require 'rails_helper'

RSpec.describe "event_conditions/show", type: :view do
  let(:user) { create :user }
  let(:event) { create :event, user: user }
  let(:sensor) { create :sensor, user: user }
  let(:event_condition) { create :event_condition, event: event, sensor: sensor }
  before(:each) do
    assign(:event_condition, event_condition)
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
