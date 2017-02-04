class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :first_name, presence: true, length: {maximum: 40}
  validates :last_name, presence: true, length: {maximum: 40}
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  DEPARTMENT = ["IT", "Computer Science"]
  COURSE_TAKEN = ["IT", "Computer Science", "Network Security", "Information System"]

end
