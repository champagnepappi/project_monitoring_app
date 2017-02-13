class User < ApplicationRecord
  before_save {self.email = email.downcase}
  validates :first_name, presence: true, length: {maximum: 40}
  validates :last_name, presence: true, length: {maximum: 40}
  validates :reg_no, presence: true, length: {maximum: 20}
  validates :gender, presence: true
  validates :department, presence: true
  validates :course_taken, presence: true
  
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  DEPARTMENT = ["IT", "Computer Science"]
  COURSE_TAKEN = ["IT", "Computer Science", "Network Security", "Information System"]
  GENDER = ["Male","Female"]

  has_secure_password
  validates :password, length: { minimum: 6 }
end
