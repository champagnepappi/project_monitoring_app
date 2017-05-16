class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  validates :lecturer_id, presence: true
  validates :message_id, presence: true
end
