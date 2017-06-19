class CreateGameData < ActiveRecord::Migration[5.0]
  def change
    drop_table :game_data
    create_table :game_data do |t|
      t.string :uuid
      t.string :game_uuid
      t.string :user_uuid
      t.string :name

      t.timestamps
    end
  end
end
