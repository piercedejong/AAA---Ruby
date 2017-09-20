class AddNameToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :name, :string
  end
end
