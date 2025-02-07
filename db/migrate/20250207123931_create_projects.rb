class CreateProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :projects do |t|
      t.string :title, null: false
      t.text :details, null: false
      t.references :user, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
