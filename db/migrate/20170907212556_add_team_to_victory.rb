class AddTeamToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :axis, :boolean
  end
end
