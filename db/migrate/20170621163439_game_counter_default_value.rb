class GameCounterDefaultValue < ActiveRecord::Migration[5.0]
  def change
    change_column :games, :current, :integer, default: 0
    change_column :games, :round, :integer, default: 1
  end
end
