class UpdateUserTable < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, null: true
    add_column :users, :last_name, :string, null: true
    add_column :users, :phone, :string, null: true
  end
end