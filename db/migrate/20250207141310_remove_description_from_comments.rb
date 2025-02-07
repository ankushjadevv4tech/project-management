class RemoveDescriptionFromComments < ActiveRecord::Migration[8.0]
  def change
    remove_column :comments, :description
  end
end
