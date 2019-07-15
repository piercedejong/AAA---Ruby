class CreateBattleCalculators < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_calculators do |t|
      t.integer :user_id
      t.string :uuid
      t.string :user_uuid
      t.string :winner
      t.string :game_version, default:"1940Global"
      t.string :battle_type, default:"land"

      t.timestamps
    end
  end
end
