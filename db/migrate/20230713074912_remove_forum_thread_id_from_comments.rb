class RemoveForumThreadIdFromComments < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :forum_thread
  end
end
