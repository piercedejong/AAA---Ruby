class AddUuidToUnit < ActiveRecord::Migration[5.0]
  def change
    add_column :units, :uuid, :string
  end
end
