class AddRidToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :rid, :integer
  end
end
