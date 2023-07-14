class AddContentToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :content, :string
  end
end
