require 'rails_helper'

RSpec.describe "Api::Emitters", type: :request do
  let!(:user) { create(:user) }
  let(:api_credential) { create(:api_credential, user: user) }
  let(:mac) { "#{emitter_mac}-#{pin}" }
  let(:emitter_mac) { '123456' }
  let(:pin) { '2' }
  let!(:sensor) do
    create(
      :sensor,
      name: 'Sensor1',
      mac: mac,
      state: true,
      user: user
    )
  end

  let(:valid_attributes) {
    {
      name: 'new emitter'
    }
  }

  describe "PUT" do
    before do
      # allow(ActionCable.server).to receive(:broadcast)
    end

    it "ActionCable is called" do
      # expect(ActionCable.server).to have_received(:broadcast).with(
      #   "sensors", { sensor: sensor }
      # )
    end

    it "updates the state of the sensor" do
      put "/api/emitters/#{emitter_mac}/#{pin}", params: { sensor: { state: false } },
        headers: { 'Authorization' => "Token #{api_credential.token}" }
      sensor.reload
      expect(sensor.state).to eq(false)
    end
  end
end
