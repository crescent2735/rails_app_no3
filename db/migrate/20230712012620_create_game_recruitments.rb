class CreateGameRecruitments < ActiveRecord::Migration[7.0]
  def change
    create_table :game_recruitments do |t|
      t.string :game_title
      t.text :description
      t.integer :num_players
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
