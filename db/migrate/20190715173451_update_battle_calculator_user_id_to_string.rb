class UpdateBattleCalculatorUserIdToString < ActiveRecord::Migration[5.2]
  def change
    change_column :battle_calculators, :user_id, :string
  end
end
