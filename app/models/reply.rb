class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
  default_scope -> { order(created_at: :desc) }
  validates :lecturer_id, presence: true
  validates :message_id, presence: true
end
