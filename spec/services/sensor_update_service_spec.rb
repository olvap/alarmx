require 'rails_helper'

describe SensorUpdateService, type: :service do
  let(:user) { create(:user) }
  let(:sensor) { create(:sensor, user: user) }
  let(:event) { create(:event, user: user) }
  let!(:event_condition) { create(:event_condition, sensor: sensor, event: event, state: true, trigger: true) }
  let(:notification_setting) { create(:notification_setting, event: event) }
  let(:telegram_service) { instance_double(TelegramService) }

  describe '#update' do
    before do
      allow(ActionCable).to receive(:server)
      allow(ActionCable.server).to receive(:broadcast)
      allow(TelegramService).to receive(:new).and_return(telegram_service)
      allow(telegram_service).to receive(:send_notification)
    end

    context 'when the sensor state has changed' do
      before { sensor.update(state: true) }

      it 'sends a message through Action Cable' do
        expect(ActionCable).to have_received(:server).at_least(:once)
      end

      context 'when there are events to notify' do
        before { notification_setting.update(chat_id: '123456') }

        it 'sends notifications' do
          expect(TelegramService).to receive(:new).and_return(double(send_notification: nil))
          SensorUpdateService.new(sensor).update
        end
      end

      context 'when there are no events to notify' do
        before { sensor.update(state: false) }

        it 'does not send notifications' do
          expect(TelegramService).not_to receive(:new)
          SensorUpdateService.new(sensor).update
        end
      end
    end

    context 'when the sensor state has not changed' do
      before { sensor.reload }

      it 'does not send any message through Action Cable' do
        expect(ActionCable.server).not_to have_received(:broadcast)
      end

      it 'does not send any notification' do
        expect(TelegramService).not_to receive(:new)
        SensorUpdateService.new(sensor).update
      end
    end
  end
end

