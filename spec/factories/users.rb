FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    last_name { '全角ぜんかくゼンカク' }
    first_name { '全角ぜんかくぜんかく' }
    last_name_kana { 'ゼンカク' }
    first_name_kana { 'ゼンカク' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    phone_number { '09012345678' }
  end
end
