class Lecturer < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy
   attr_accessor :first_name, :last_name, :email, :password, :password_confirmation
end
