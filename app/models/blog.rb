class Blog < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :title, presence: true
  validates :content, presence: true
  mount_uploader :url, BlogCoverUploader
end
