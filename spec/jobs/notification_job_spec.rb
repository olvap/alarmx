require 'rails_helper'

describe NotificationJob, type: :job do
  let(:sensor) { create(:sensor) }
  let(:notification_setting) { sensor.notification_setting }
  let(:instance) { instance_double(TelegramService) }

  describe 'when send_notification? is true' do
    before do
      expect(TelegramService).to receive(:new) { instance }
      allow(sensor.notification_setting).to receive(:send_notification?).with(any_args).and_return(true)
      allow(instance).to receive(:send_notification)
      expect(instance).to receive(:send_notification).once
    end

    it 'Send message over telegram' do
      expect {
        described_class.perform_now(sensor)
      }.to change { notification_setting.reload.last_send_at }
    end
  end

  describe 'when send_notification? is falsey' do
    before do
      allow(sensor.notification_setting).to receive(:send_notification?).with(any_args).and_return(false)
    end

    it 'Do not Send message over telegram' do
      expect {
        described_class.perform_now(sensor)
      }.not_to change { notification_setting.reload.last_send_at }
    end
  end
end
