class AddUuidToGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :uuid, :string
  end
end
