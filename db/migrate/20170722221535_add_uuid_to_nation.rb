class AddUuidToNation < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :uuid, :string
  end
end
