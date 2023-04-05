require 'rails_helper'

RSpec.describe "Api::Sensors", type: :request do
  let!(:sensor) { create(:sensor, name: 'Sensor1', state: true, user: user) }
  let(:user) { create(:user) }
  let(:api_credential) { create(:api_credential, user: user) }

  let(:valid_attributes) {
    {
      name: 'back door'
    }
  }

  let(:invalid_attributes) {
    { states: nil }
  }

  describe "GET /show" do
    before do
      get "/api/sensors/#{sensor.id}",
        headers: { 'Authorization' => "Token #{api_credential.token}" }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns the sensor data as JSON" do
      json_response = JSON.parse(response.body)
      expect(json_response["name"]).to eq("Sensor1")
      expect(json_response["state"]).to eq(true)
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
      put "/api/sensors/#{sensor.id}", params: { sensor: { state: false } },
        headers: { 'Authorization' => "Token #{api_credential.token}" }
      sensor.reload
      expect(sensor.state).to eq(false)
    end
  end
end
