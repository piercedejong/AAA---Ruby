class AddSepiaToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sepia, :boolean, :default => false
  end
end
