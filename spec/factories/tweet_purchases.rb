FactoryBot.define do
  factory :tweet_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    price { '100' }
    association :tweet
    association :user
  end
end
