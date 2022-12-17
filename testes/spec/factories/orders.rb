FactoryBot.define do
  factory :order do
    description { Faker::Name.name }
    customer
  end
end
