class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, null: false
      t.references :commentable, null: false, polymorphic: true
      t.string :comment_contents, null: false

      t.timestamps
    end
  end
end
