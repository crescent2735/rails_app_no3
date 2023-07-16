class AddChannelNameToGameRecruitments < ActiveRecord::Migration[7.0]
  def change
    add_column :game_recruitments, :channel_name, :string
  end
end
