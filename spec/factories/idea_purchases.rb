FactoryBot.define do
  factory :idea_purchase do
    token { 'tok_abcdefghijk00000000000000000' }
    association :idea
    association :user
  end
end
