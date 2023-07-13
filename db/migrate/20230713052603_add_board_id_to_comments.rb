class AddBoardIdToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :board, null: false, foreign_key: true
  end
end
