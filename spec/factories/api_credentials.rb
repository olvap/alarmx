FactoryBot.define do
  factory :api_credential do
    key { '123123' }
    secret { 'abcabcabc' }
    user
  end
end
