class AddColumnUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :adress, :string
    remove_column :users, :introduction, :string
    add_column :users, :name, :string, null: false
    add_column :users, :adress, :string
    add_column :users, :introduction, :string
  end
end
