class AddDefaultToUnitSpecial < ActiveRecord::Migration[5.0]
  def change
    change_column :units, :special, :string, :default => ""
  end
end
