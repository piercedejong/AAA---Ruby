class AddUuidToVictory < ActiveRecord::Migration[5.0]
  def change
    add_column :victories, :uuid, :string
  end
end
