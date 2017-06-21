class AddGameNametoNaton < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :game_name, :string
    add_column :units, :game_name, :string
  end
end
