class UpdateGamesUserIdToString < ActiveRecord::Migration[5.2]
  def change
    change_column :games, :user_id, :string
  end
end
