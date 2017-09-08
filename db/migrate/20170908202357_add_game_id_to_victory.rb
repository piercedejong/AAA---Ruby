class AddGameIdToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :game_id, :integer
  end
end
