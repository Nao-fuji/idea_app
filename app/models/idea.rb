class Idea < ApplicationRecord
  validates :title, presence: true, length:{maximum: 8}
  validates :idea, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 500, message: 'の範囲は¥1~¥500の間で設定してください' }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
