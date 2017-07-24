class Message < ApplicationRecord
  belongs_to :user
  has_many :replies
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  mount_uploader :video, VideoUploader
  validates :content, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validate :picture_size

  def set_success(format, opts)
    self.success = true
  end

  has_attached_file :video, :styles => {
     :mobile => { :geometry => "400*300",
                  :format => 'mp4',
                  :streaming => true}
  }, :processors => [:ffmpeg, :qtfaststart]

  private
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
