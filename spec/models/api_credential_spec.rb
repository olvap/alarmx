require 'rails_helper'

RSpec.describe ApiCredential, type: :model do
  describe "when creating a new instance" do
    let(:credential) { ApiCredential.new }

    it "generates a token attribute" do
      expect(credential.token).not_to be_nil
    end
  end
end
