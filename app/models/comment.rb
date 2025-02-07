class Comment < ApplicationRecord
  has_rich_text :description

  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
