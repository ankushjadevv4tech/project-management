class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  enum :status, { draft: 0, appoved: 1, delivered: 2 }
  validates :title, :details, presence: true
end
