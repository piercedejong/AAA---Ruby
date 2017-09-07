class AddUuidToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :uuid, :string
  end
end
