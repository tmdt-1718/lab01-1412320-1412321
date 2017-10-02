class Image < ApplicationRecord
  mount_uploader :url, ImageUploader
  belongs_to :user
  belongs_to :album
  validates :url, presence: true
end
