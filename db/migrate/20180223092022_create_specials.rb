class CreateSpecials < ActiveRecord::Migration[5.0]
  def change
    create_table :specials do |t|
      t.string :title
      t.string :info
      t.string :unit_id
      t.integer :sid
      t.timestamps
    end
  end
end
