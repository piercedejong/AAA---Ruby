class AddPriorityToUnits < ActiveRecord::Migration[5.2]
  def change
    add_column :units, :priority, :integer, default:0
  end
end
