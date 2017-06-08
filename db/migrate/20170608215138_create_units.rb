class CreateUnits < ActiveRecord::Migration[5.0]
  def change
    create_table :units do |t|
      t.string :name
      t.string :special
      t.integer :attack
      t.integer :defense
      t.integer :movement
      t.integer :cost
      t.integer :count

      t.timestamps
    end
  end
end
