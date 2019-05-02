class AddUnitToSpecial < ActiveRecord::Migration[5.2]
  def change
    add_column :specials, :unit_name, :string
    add_column :specials, :game, :string
  end
end
