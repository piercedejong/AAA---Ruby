class DropGameDataTable < ActiveRecord::Migration[5.0]
  def change

    drop_table :game_data
  end
end
