class AddColorLToNation < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :colorL, :string
  end
end
