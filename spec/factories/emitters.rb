FactoryBot.define do
  factory :emitter do
    building
    token { "ABC123" }
    name { "Emitter" }
  end
end

