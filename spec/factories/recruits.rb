FactoryBot.define do
  factory :recruit do
    theme {Faker::Lorem.sentence}
    price {'100~200'}
    category_id {2}
    association :user
  end
end
