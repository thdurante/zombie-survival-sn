FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Gender.names.sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }

    trait :with_items do
      transient do
        items nil
      end

      after(:build) do |survivor, evaluator|
        survivor.items = if evaluator.items
                           evaluator.items
                         else
                           TradeItem.names.map do |trade_item|
                             build(:item, kind: trade_item, survivor: survivor)
                           end
                         end
      end
    end

    trait :with_authored_infection_alerts do
      transient do
        authored_infection_alerts nil
      end

      after(:build) do |survivor, evaluator|
        survivor.authored_infection_alerts = if evaluator.authored_infection_alerts
                                               evaluator.authored_infection_alerts
                                             else
                                               [build(:infection_alert, author: survivor)]
                                             end
      end
    end

    trait :with_received_infection_alerts do
      transient do
        received_infection_alerts nil
      end

      after(:build) do |survivor, evaluator|
        survivor.received_infection_alerts = if evaluator.received_infection_alerts
                                               evaluator.received_infection_alerts
                                             else
                                               [build(:infection_alert, infected_survivor: survivor)]
                                             end
      end
    end
  end
end
