class Request < ApplicationRecord
  belongs_to :user
  belongs_to :game_recruitment
end
