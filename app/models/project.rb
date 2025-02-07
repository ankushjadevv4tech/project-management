class Project < ApplicationRecord
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :details, presence: true
end
