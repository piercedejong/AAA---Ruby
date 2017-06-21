class RemoveGameNamefromNations < ActiveRecord::Migration[5.0]
  def change
    remove_column :nations, :game_name
    remove_column :units, :game_name
    add_column :games, :game_name, :string
    add_column :games, :user_id, :int
    add_column :games, :user_uuid, :string
  end
end
