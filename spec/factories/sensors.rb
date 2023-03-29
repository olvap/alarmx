FactoryBot.define do
  factory :sensor do
    name { 'DoorSensor' }
    mac { '12131312' }
    state { false }
  end
end
