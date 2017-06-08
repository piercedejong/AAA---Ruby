class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :current
      t.integer :round

      t.timestamps
    end
  end
end
