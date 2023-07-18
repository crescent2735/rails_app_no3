class GameRecruitment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :request
  validates :user_id, presence: true
  validates :board_id, presence: true
  validates :game_title, presence: true
  validates :channel_name, presence: true, length: { maximum: 32 }
  validates :description, length: { maximum: 30 }
  validates :num_players, length: { maximum: 8 }
end
