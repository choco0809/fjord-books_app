class AdressToAddress < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :adress, :address
  end
end
