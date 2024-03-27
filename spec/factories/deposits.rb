FactoryBot.define do
  factory :deposit do
    tradeline { "1" }
    amount { "9.99" }
    date { "2024-03-26" }
  end
end
