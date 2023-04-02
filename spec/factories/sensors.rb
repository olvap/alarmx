FactoryBot.define do
  factory :sensor do
    name { 'DoorSensor' }
    state { false }
    pin { 2 }
    notification_setting
    emitter
  end
end
