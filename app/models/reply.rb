class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
  validates :content, presence: true, length: { maximum: 140 }
  default_scope -> { order(created_at: :desc) }
  validates :lecturer_id, presence: true
  validates :message_id, presence: true
end
