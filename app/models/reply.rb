class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
  mount_uploader :picture, PictureUploader
  validates :content, presence: true, length: { maximum: 1000 }
  default_scope -> { order(created_at: :desc) }
  validates :lecturer_id, presence: true
  validates :message_id, presence: true
  validate :picture_size

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
