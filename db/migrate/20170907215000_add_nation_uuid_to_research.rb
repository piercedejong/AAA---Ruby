class AddNationUuidToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :nation_uuid, :string
  end
end
