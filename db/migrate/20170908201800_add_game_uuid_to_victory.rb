class AddGameUuidToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :game_uuid, :string
  end
end
