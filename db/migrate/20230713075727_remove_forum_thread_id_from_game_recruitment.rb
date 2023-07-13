class RemoveForumThreadIdFromGameRecruitment < ActiveRecord::Migration[7.0]
  def change
    remove_reference :game_recruitments, :forum_thread
  end
end
