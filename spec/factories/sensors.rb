FactoryBot.define do
  factory :sensor do
    name { 'DoorSensor' }
    mac { '12:13:13:12' }
    state { false }
  end
end
