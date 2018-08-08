FactoryBot.define do
  factory :item do
    association :survivor
    kind { TradeItem.names.sample }
    amount { Faker::Number.number(2) }
  end
end
