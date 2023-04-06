require 'rails_helper'

describe Sensor, type: :model do
  let(:event) { create(:event, user: user) }
  let(:user) { create(:user) }
  let(:notification_setting) { create(:notification_setting) }
  let(:sensor) { create(:sensor, user: user, notification_setting: notification_setting) }

  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:notification_setting) }
    it { should have_many(:event_conditions).dependent(:restrict_with_exception) }
    it { should have_many(:triggers).class_name("EventCondition") }
  end

  describe "callbacks" do
    describe "#check_for_related_event_conditions" do
      let!(:event_condition) do
        create(:event_condition, sensor: sensor, event: event)
      end

      it "prevents destroying the sensor if there are related event conditions" do
        expect(sensor.destroy).to be_falsey
        expect(sensor.errors.full_messages).to include("No puedes eliminar un Sensor que tiene EventConditions relacionados")
      end

      it "allows destroying the sensor if there are no related event conditions" do
        event_condition.destroy
        expect { sensor.destroy }.to change { Sensor.count }.by(-1)
      end
    end

    describe "#set_defaults" do
      it "sets the default notification setting" do
        sensor = build(:sensor, user: user)
        expect(sensor.notification_setting.id).to be_nil
        sensor.save
        expect(sensor.notification_setting.id).not_to be_nil
      end
    end
  end
end
