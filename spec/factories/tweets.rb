FactoryBot.define do
  factory :tweet do
    idea { Faker::Lorem.sentence }
    explain { Faker::Lorem.sentence }
    association :user
    association :recruit
  end
end
