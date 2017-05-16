class Reply < ApplicationRecord
  belongs_to :message
  belongs_to :lecturer
  validates :lecturer_id, presence: true
  validates :message_id, presence: true
end
