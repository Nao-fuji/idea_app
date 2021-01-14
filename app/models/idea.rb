class Idea < ApplicationRecord
  validates :title, presence: true, length:{maximum: 8}
  validates :idea, :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 50, less_than_or_equal_to: 500, message: 'の範囲は¥50~¥500の間で設定してください' }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  
  belongs_to :user
  has_many :likes
  has_many :dislikes
  has_one :idea_purchase
  has_one_attached :image

  def self.search(search)
    if search != ""
      Idea.where('title LIKE(?)', "%#{search}%")
    else
      Idea.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
