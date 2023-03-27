require 'rails_helper'

RSpec.describe ApiCredential, type: :model do
  describe "when creating a new instance" do
    let(:credential) { ApiCredential.new }

    it "generates a key attribute" do
      expect(credential.key).not_to be_nil
    end

    it "generates a secret attribute" do
      expect(credential.secret).not_to be_nil
    end
  end
end
