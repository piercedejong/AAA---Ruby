class AddGameIDtoNation < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :game_id, :integer
  end
end
