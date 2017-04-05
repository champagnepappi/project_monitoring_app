class Lecturer < ApplicationRecord
  name_regex = /\A[a-z]+\Z/i
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true
end
