require 'rails_helper'

describe NotificationSetting, type: :model do
  let(:notification_setting) { create(:notification_setting) }

  describe '#send_notification?' do
    context 'when the notification setting is active' do
      it 'returns true' do
        notification_setting.update(active: true)
        expect(notification_setting.send_notification?(Time.current)).to be_truthy
      end
    end

    context 'when the notification setting is inactive' do
      it 'returns false' do
        notification_setting.update(active: false)
        expect(notification_setting.send_notification?(Time.current)).to be_falsey
      end
    end
  end

  describe '#mark_notification_sent' do
    it 'updates the last_send_at attribute' do
      current_time = Time.current
      notification_setting.mark_notification_sent(current_time)
      expect(notification_setting.last_send_at.to_i).to eq(current_time.to_i)
    end
  end
end
