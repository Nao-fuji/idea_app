class Identification < ApplicationRecord
  validates :phone_number, presence: true, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'ハイフンは必要ありません' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  belongs_to :user, optional: true
end
