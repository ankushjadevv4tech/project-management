class Project < ApplicationRecord
  belongs_to :user

  validates :title, :details, presence: true
end
