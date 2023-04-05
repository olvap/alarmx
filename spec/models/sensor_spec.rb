require 'rails_helper'

describe Sensor, type: :model do
  context "when creating a new sensor" do
    let(:user) { create(:user) }
    let(:sensor) { create(:sensor, user: user) }

    it "has a reference to user" do
      expect(sensor.user).to eq(user)
    end

    it "has state set to false by default" do
      expect(sensor.state).to be_falsey
    end
  end
end
