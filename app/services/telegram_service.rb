require 'telegram/bot'

class TelegramService

  def initialize(token = nil)
    self.token = token || ENV['TELEGRAM_BOT_TOKEN']
  end

  def send_notification(chat_id = nil, message = nil)
    return unless token
    return unless chat_id

    bot = Telegram::Bot::Api.new token
    bot.send_message(chat_id: chat_id, text: message)
  end

  private

  attr_accessor :token
end
