class CreateNations < ActiveRecord::Migration[5.0]
  def change
    create_table :nations do |t|
      t.string :name
      t.string :roundel
      t.string :color
      t.integer :bank
      t.integer :income

      t.timestamps
    end
  end
end
