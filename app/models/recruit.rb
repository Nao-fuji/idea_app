class Recruit < ApplicationRecord
  validates :theme, :price,presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  
  belongs_to :user
  has_many :tweets

  def self.search(search)
    if search != ""
      Recruit.where('theme LIKE(?)', "%#{search}%")
    else
      Recruit.all
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
end
