FactoryBot.define do
  factory :subscription do
    customer_id { Faker::Number.between(from: 1, to: 5) }
    tea_id { Faker::Number.between(from: 1, to: 5) }
    title { Faker::Subscription.plan }
    price { Faker::Number.between(from: 1, to: 100).to_s }
    status { Faker::Subscription.status }
    frequency { Faker::Subscription.subscription_term }
  end
end