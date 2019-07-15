class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, :primary_key => :uuid do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
    change_column :users, :uuid, :string
  end
end
