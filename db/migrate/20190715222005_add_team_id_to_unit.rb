class AddTeamIdToUnit < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :team_id, :integer
  end
end
