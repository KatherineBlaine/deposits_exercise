FactoryBot.define do
  factory :deposit do
    tradeline { nil }
    amount { "9.99" }
    date { "2024-03-26" }
  end
end
