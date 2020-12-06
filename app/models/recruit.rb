class Recruit < ApplicationRecord
  validates :theme, presence: true
  validates :price, presence: true,format: {with:/\A[0-9]+\z/, message:'半角数字を入力してください'}
  validates :category_id, presence: true, numericality: { other_than: 1 }
  
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
