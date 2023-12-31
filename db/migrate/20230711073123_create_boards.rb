class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :boards, [:user_id, :created_at]
  end
end
