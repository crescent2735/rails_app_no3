class GameRecruitment < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_many :request
  validates :user_id, presence: true
end
