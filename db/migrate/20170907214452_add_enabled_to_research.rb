class AddEnabledToResearch < ActiveRecord::Migration[5.0]
  def change
    add_column :researches, :enabled, :boolean, default: false
  end
end
