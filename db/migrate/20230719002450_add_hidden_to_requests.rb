class AddHiddenToRequests < ActiveRecord::Migration[7.0]
  def change
    add_column :requests, :hidden, :boolean, default: false
  end
end
