FactoryBot.define do
  factory :identification do
    last_name { '全角ぜんかくゼンカク' }
    first_name { '全角ぜんかくぜんかく' }
    last_name_kana { 'ゼンカク' }
    first_name_kana { 'ゼンカク' }
    phone_number { '09012345678' }
  end
end
