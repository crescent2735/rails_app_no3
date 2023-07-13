class Board < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :game_recruitments 
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 30 }
end
