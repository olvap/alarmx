FactoryBot.define do
  factory :sensor do
    building
    name { 'DoorSensor' }
    state { false }
  end
end
