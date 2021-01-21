class TweetPurchase < ApplicationRecord
  attr_accessor :token

  validates :token, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 10_000, message: 'の範囲は¥50~¥10000の間で設定してください' }

  belongs_to :user
  belongs_to :tweet
end
