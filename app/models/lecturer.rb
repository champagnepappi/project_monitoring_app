class Lecturer < ApplicationRecord
  attr_accessor :activation_token, :remember_token
  before_save {self.first_name = first_name.capitalize}
  before_save {self.last_name = last_name.capitalize}
  before_create :create_activation_digest
  name_regex = /\A[a-z]+\Z/i
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def Lecturer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def Lecturer.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = Lecturer.new_token
    update_attribute(:remember_digest, Lecturer.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
  def create_activation_digest
    self.activation_token = Lecturer.new_token
    self.activation_digest = Lecturer.digest(activation_token)
  end
end
