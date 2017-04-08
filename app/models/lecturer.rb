class Lecturer < ApplicationRecord
  attr_accessor :activation_token
  before_save {self.first_name = first_name.capitalize}
  before_save {self.last_name = last_name.capitalize}
  name_regex = /\A[a-z]+\Z/i
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def Lecturer.new_token
    SecureRandom.urlsafe_base64
  end
end
