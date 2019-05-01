class CreateBattleCalculators < ActiveRecord::Migration[5.2]
  def change
    create_table :battle_calculators do |t|
      t.integer :user_id
      t.string :uuid
      t.string :user_uuid
      t.string :winner
      t.string :game

      t.timestamps
    end
  end
end
