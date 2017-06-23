class AddNidToNation < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :nid, :integer
    add_column :units, :uid, :integer
  end
end
