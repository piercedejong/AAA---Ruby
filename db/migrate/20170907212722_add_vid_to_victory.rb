class AddVidToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :vid, :integer
  end
end
