class ChangeObjIncomeNation < ActiveRecord::Migration[5.0]
  def change
    change_column :nations, :obj_income, :integer, :default => 0
  end
end
