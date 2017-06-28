class AddBanktoGame < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :bank, :integer
  end
end
