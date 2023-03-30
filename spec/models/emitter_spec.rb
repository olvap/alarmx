require 'rails_helper'

RSpec.describe Emitter, type: :model do
  context "when creating a new emitter" do
    let(:building) { create(:building) }
    let(:user) { building.user }
    let(:emitter) { create(:emitter, building: building) }

    it "has a reference to building" do
      expect(emitter.building).to eq(building)
    end

    it "has token set by default" do
      emitter = Emitter.create(building: building)
      expect(emitter.token).to be_truthy
    end
  end
end
