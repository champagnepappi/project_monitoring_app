class Lecturer < ApplicationRecord
  has_secure_password
  name_regex = /\A[a-z]+\Z/i
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
end
