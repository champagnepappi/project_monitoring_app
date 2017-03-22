class Project < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2, finished: 3 }
  belongs_to :user
  validates :title, length: { minimum: 5 }, presence: true, uniqueness: true
  validates :description, length: { minimum: 10 }, presence: true
end
