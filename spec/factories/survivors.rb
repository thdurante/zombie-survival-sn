FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Gender.names.sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    trait :with_items do
      transient do
        items
      end

      after(:build) do |survivor, evaluator|
        survivor.items = if evaluator.items
                           evaluator.items
                         else
                           TradeItem.names.each do |trade_item|
                             build(:item, kind: trade_item, survivor: survivor)
                           end
                         end
      end
    end
  end
end
