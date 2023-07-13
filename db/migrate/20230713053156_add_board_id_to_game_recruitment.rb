class AddBoardIdToGameRecruitment < ActiveRecord::Migration[7.0]
  def change
    add_reference :game_recruitments, :board, null: false, foreign_key: true
  end
end
