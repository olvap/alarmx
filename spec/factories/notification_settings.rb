FactoryBot.define do
  factory :notification_setting do
    active { false }
    start_time { "2023-03-31 19:48:16" }
    end_time { "2023-03-31 19:48:16" }
    cooldown { 10 }
  end
end
