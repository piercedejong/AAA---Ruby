class AddUserUuidToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_uuid, :string
  end
end
