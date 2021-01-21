FactoryBot.define do
  factory :idea do
    title { 'hoge' }
    idea { Faker::Lorem.sentence }
    price { '100' }
    category_id { 2 }
    association :user
  end
end
