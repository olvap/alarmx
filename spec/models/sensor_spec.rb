require 'rails_helper'

RSpec.describe Sensor, type: :model do
  context "when creating a new sensor" do
    let(:emitter) { create(:emitter) }
    let(:user) { building.user }
    let(:sensor) { create(:sensor, emitter: emitter) }

    it "has a reference to emitter" do
      expect(sensor.emitter).to eq(emitter)
    end

    it "has state set to false by default" do
      expect(sensor.state).to be_falsey
    end
  end
end
