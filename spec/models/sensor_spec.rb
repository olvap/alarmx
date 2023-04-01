require 'rails_helper'

RSpec.describe Sensor, type: :model do
  context "when creating a new sensor" do
    let(:building) { create(:building) }
    let(:user) { building.user }
    let(:sensor) { create(:sensor, building: building) }

    it "has a reference to building" do
      expect(sensor.building).to eq(building)
    end

    it "has state set to false by default" do
      expect(sensor.state).to be_falsey
    end
  end
end
