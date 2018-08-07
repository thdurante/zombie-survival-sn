FactoryBot.define do
  factory :survivor do
    name { Faker::Name.name }
    age { Faker::Number.number(2) }
    gender { Gender.names.sample }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
