class AddTextToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :text, :string
  end
end
