require 'rails_helper'

describe ApiCredential, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "validations" do
    subject { FactoryBot.build(:api_credential, user: user) }

    it { should validate_uniqueness_of(:token) }
  end

  describe "callbacks" do
    let(:credential) { FactoryBot.create(:api_credential, user: user) }

    it "generates a token on initialization" do
      expect(credential.token).not_to be_nil
    end

    it "generates a unique token" do
      expect(ApiCredential.where(token: credential.token).count).to eq(1)
      new_credential = FactoryBot.create(:api_credential, user: user)
      expect(new_credential.token).not_to eq(credential.token)
    end
  end
end

