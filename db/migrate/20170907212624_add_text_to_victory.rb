class AddTextToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :text, :string
  end
end
