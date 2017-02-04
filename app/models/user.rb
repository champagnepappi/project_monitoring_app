class User < ApplicationRecord
  validates :first_name, presence: true, length: {maximum: 40}
  validates :last_name, presence: true, length: {maximum: 40}
  DEPARTMENT = ["IT", "Computer Science"]
  COURSE_TAKEN = ["IT", "Computer Science", "Network Security", "Information System"]

end
