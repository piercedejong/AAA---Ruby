class AddNameToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :name, :string
  end
end
