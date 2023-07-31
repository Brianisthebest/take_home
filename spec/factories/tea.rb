FactoryBot.define do
  factory :tea do
    title { Faker::Tea.type }
    description { Faker::Lorem.sentence }
    temperature { Faker::Number.between(from: 0, to: 100).to_s }
    brew_time { Faker::Number.between(from: 0, to: 10).to_s }
  end
end