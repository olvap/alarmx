require 'rails_helper'

RSpec.describe Building, type: :model do
  context "when name is not present" do
    it "is not valid" do
      building = Building.new(name: nil)
      expect(building).not_to be_valid
      expect(building.errors.messages[:name]).to include("can't be blank")
    end
  end
end
