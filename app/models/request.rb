class Request < ApplicationRecord
  belongs_to :user
  belongs_to :game_recruitment
  validates :user_id, presence: true
  validates :game_recruitment_id, presence: true
  validates :content, length: { maximum: 30 }
end
