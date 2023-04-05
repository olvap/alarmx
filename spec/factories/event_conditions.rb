FactoryBot.define do
  factory :event_condition do
    event
    sensor
    state { false }
    trigger { false }
  end
end
