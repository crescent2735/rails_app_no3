class DropForumThreads < ActiveRecord::Migration[7.0]
  def change
    drop_table :forum_threads, force: :cascade
  end
end
