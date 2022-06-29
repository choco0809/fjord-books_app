class CreateReports < ActiveRecord::Migration[6.1]
  def change
    create_table :reports do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.string :contents

      t.timestamps
    end
  end
end
