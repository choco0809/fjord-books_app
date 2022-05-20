class AddAdressToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :adress, :string
  end
end
