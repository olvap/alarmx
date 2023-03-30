require 'rails_helper'

RSpec.describe "Api::Emitters", type: :request do
  let!(:user) { create(:user) }
  let!(:building) { create(:building, user: user) }
  let(:emitter) {create(:emitter, building: building)}
  let(:sensor) { create(:sensor, name: 'Sensor1', state: true, user: user, emitter:emitter) }
  let(:api_credential) { create(:api_credential, user: user) }

  let(:valid_attributes) {
    {
      name: 'new emitter'
    }
  }
  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Emitter" do
        expect {
          post '/api/emitters', params: { emitter: valid_attributes },
            headers: { 'Authorization' => "Token #{api_credential.token}" }
        }.to change(Emitter, :count).by(1)
      end
    end
  end

  describe "PUT" do
    before do
      allow(ActionCable.server).to receive(:broadcast)
    end

    it "ActionCable is called" do
      # expect(ActionCable.server).to have_received(:broadcast).with(
      #   "sensors", { sensor: sensor }
      # )
    end

    it "updates the state of the sensor" do
      put "/api/emitters/#{emitter.token}/#{sensor.pin}", params: { sensor: { state: false } },
        headers: { 'Authorization' => "Token #{api_credential.token}" }
      sensor.reload
      expect(sensor.state).to eq(false)
    end
  end
end
