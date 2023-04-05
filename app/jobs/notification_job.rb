# class NotificationJob < ApplicationJob
#   queue_as :default
#
#   def perform(sensor)
#     notification_setting = sensor.notification_setting
#     current_time = Time.current
#
#     if notification_setting.send_notification?(current_time)
#
#       TelegramService.new.send_notification(
#         sensor.user.setting.chat_id,
#         "Sensor: #{sensor.name} State: #{sensor.state}"
#       )
#
#       notification_setting.mark_notification_sent(current_time)
#     end
#   end
# end
