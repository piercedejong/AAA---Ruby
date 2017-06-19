class RemoveUuidFromGame < ActiveRecord::Migration[5.0]
  def change
    remove_column :games, :user_id
    remove_column :games, :user_uuid
  end
end
