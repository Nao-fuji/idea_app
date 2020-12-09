class Tweet < ApplicationRecord
  validates :idea, :explain,presence: true
  
  belongs_to :user
  belongs_to :recruit
end
