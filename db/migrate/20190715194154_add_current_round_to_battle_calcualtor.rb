class AddCurrentRoundToBattleCalcualtor < ActiveRecord::Migration[5.2]
  def change
    add_column :battle_calculators, :current_round, :integer, default: 1
    add_column :battle_calculators, :max_round, :integer, default: 1
    add_column :battle_calculators, :current_simulation, :integer, default: 1
    add_column :battle_calculators, :max_simulations, :integer, default: 1
  end
end
