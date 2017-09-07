class AddEnabledToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :enabled, :boolean, default: false
  end
end
