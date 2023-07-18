class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :content, presence: true, length: { maximum: 40 }
end
