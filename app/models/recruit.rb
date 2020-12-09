class Recruit < ApplicationRecord
  validates :theme, :price,presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  
  belongs_to :user
  has_many :tweets

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
