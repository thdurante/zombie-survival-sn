FactoryBot.define do
  factory :infection_alert do
    association :author, factory: :survivor
    association :infected_survivor, factory: :survivor
  end
end
