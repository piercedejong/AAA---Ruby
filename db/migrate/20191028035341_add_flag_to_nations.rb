class AddFlagToNations < ActiveRecord::Migration[5.2]
  def change
    add_column :nations, :flag, :string
  end
end
