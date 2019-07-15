class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.integer :battle_calculator_id
      t.integer :wins, default: 0
      t.integer :loses, default: 0
      t.integer :starting_units, default: 0
      t.integer :starting_land, default: 0
      t.integer :starting_air, default: 0
      t.integer :starting_water, default: 0
      t.boolean :attacker, default: false

      t.timestamps
    end
  end
end
