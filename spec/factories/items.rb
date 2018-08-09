FactoryBot.define do
  factory :item do
    association :survivor
    kind { TradeItem.names.sample }
  end
end
