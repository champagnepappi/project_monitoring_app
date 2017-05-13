class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }
  validates :content, presence: true
end