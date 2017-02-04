class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  DEPARTMENT = ["IT", "Computer Science"]
  COURSE_TAKEN = ["IT", "Computer Science", "Network Security", "Information System"]

end
