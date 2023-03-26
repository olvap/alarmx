require 'rails_helper'

RSpec.describe "Api::Sensors", type: :request do
  describe "GET /show" do
    let(:sensor) { create(:sensor, name: 'Sensor1', state: true) }

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
end
