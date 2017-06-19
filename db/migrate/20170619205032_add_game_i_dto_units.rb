class AddGameIDtoUnits < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :game_id, :integer
  end
end
