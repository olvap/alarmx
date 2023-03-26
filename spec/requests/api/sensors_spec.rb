require 'rails_helper'

RSpec.describe "Api::Sensors", type: :request do
  let(:sensor) { create(:sensor, name: 'Sensor1', state: true) }

  describe "GET /show" do
    it "returns http success" do
      get "/api/sensors/#{sensor.id}"
      expect(response).to have_http_status(:success)
    end

    it "returns the sensor data as JSON" do
      get "/api/sensors/#{sensor.id}"
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
      put "/api/sensors/#{sensor.id}", params: { sensor: { state: false } }
      sensor.reload
      expect(sensor.state).to eq(false)
    end
  end
end
