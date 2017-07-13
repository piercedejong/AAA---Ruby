class CreateObjectives < ActiveRecord::Migration[5.0]
  def change
    create_table :objectives do |t|
      t.integer :nation_id
      t.integer :value
      t.string :name
      t.text :info
      t.boolean :enabled

      t.timestamps
    end
  end
end
