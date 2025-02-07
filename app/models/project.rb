class Project < ApplicationRecord
  attr_accessor :current_action_user

  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :activities, as: :trackable, dependent: :destroy

  enum :status, { draft: 0, appoved: 1, delivered: 2 }
  validates :title, :details, presence: true

  after_update_commit do
    self.activities.create!(user: current_action_user, event: "#{current_action_user.email} changed status to #{status} from #{saved_changes[:status].first} ") if saved_change_to_status?
  end
end
