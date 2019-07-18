class AddHitpointsToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :hitpoints, :integer, default: 1
  end
end
