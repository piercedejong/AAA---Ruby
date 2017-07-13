class AddOIdToObjective < ActiveRecord::Migration[5.0]
  def change
    add_column :objectives, :oid, :integer
  end
end
