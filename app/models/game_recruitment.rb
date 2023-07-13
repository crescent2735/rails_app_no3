class GameRecruitment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  validates :user_id, presence: true
end
