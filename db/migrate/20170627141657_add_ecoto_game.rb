class AddEcotoGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :eco, :integer, default: 0
  end
end
