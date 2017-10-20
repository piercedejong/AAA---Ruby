class AddObjINcomeToNation < ActiveRecord::Migration[5.0]
  def change
    add_column :nations, :obj_income, :integer
  end
end
