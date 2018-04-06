class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :build

  validates :user_id, presence: true
  validates :build_id, presence: true
  validates :body, presence: true
end
