class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :commentable, polymorphic: true, null: false
      t.references :user, null: false, foreign_key: true, index: true
      t.text :description, null: false

      t.timestamps
    end
  end
end
