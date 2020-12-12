class IdeaPurchase < ApplicationRecord
  attr_accessor :token

  validates :token, presence: true

  belongs_to :user
  belongs_to :idea
end
