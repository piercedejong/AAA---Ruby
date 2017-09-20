class AddNationIdToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :nation_id, :integer
  end
end
