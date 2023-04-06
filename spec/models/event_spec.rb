require 'rails_helper'

describe Event, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:event) { FactoryBot.create(:event, user: user) }
  let(:notification_setting) { event.notification_setting }
  let(:sensor1) { FactoryBot.create(:sensor, user: user) }
  let(:sensor2) { FactoryBot.create(:sensor, user: user) }
  let(:event_condition1) { FactoryBot.create(:event_condition, event: event, sensor: sensor1, state: true, trigger: true) }
  let(:event_condition2) { FactoryBot.create(:event_condition, event: event, sensor: sensor2, state: false, trigger: false) }
  let(:out_of_home) { create(:event_condition, event: event, sensor: sensor2, state: true, trigger: false) }
  let(:front_door) { FactoryBot.create(:event_condition, event: event, sensor: sensor1, state: true, trigger: true) }

  describe "#all_conditions_checked?" do
    context "when all conditions are checked" do
      it "returns true" do
        event_condition2
        expect(event.all_conditions_checked?).to eq(true)
      end
    end

    context "when not all conditions are checked" do
      it "returns false" do
        event_condition1.update(state: true)
        expect(event.all_conditions_checked?).to eq(false)
      end

      it "returns false with multiples conditions" do
        front_door.sensor.update(state: true)
        out_of_home
        expect(event.all_conditions_checked?).to eq(false)
      end
    end
  end

  describe "callbacks" do
    describe "#create_setting" do
      context "when notification_setting is not present" do
        it "creates a new notification_setting" do
          event.update(notification_setting: nil)
          expect(event.reload.notification_setting).to_not be_nil
        end
      end

      context "when notification_setting is present" do
        it "does not create a new notification_setting" do
          expect(event.notification_setting).to eq(notification_setting)
        end
      end
    end
  end
end

