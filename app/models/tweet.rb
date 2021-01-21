class Tweet < ApplicationRecord
  validates :idea, :explain, presence: true

  belongs_to :user
  belongs_to :recruit
  has_one :tweet_purchase
  has_one_attached :image
end
