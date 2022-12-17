FactoryBot.define do
  factory :customer, aliases: [:user] do
    transient do
      upcased { false }
      quantity_orders { 3 }
    end

    name { Faker::Name.name }
    email { Faker::Internet.email }
    vip { false }
    days_to_pay { 10 }
    address { Faker::Address.full_address }

    trait :male do
      gender { 'M' }
    end

    trait :female do
      gender { 'F' }
    end

    trait :with_orders do
      after(:create) do |customer, evaluator|
        create_list(:order, evaluator.quantity_orders, customer: customer)
      end
    end

    factory :customer_vip do
      vip { true }
      days_to_pay { 30 }
    end

    after(:create) do |customer, evaluator|
      customer.name.upcase! if evaluator.upcased
    end
  end
end