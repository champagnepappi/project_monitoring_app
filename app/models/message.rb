class Message < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
end
