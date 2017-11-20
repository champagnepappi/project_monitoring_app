class User < ApplicationRecord
  enum role: {user: 0, lecturer: 1}
  enum status: {not_assigned: 0, assigned: 1} 
  has_many :payments
  has_many :projects
  has_many :messages, dependent: :destroy
  has_one :bid
  has_one :lecturer
  has_one :active_relationship, class_name: "Relationship",
                                foreign_key: "supervised_id",
                                dependent: :destroy
  has_one :supervised, through: :active_relationship, source: :supervisor
  attr_accessor :remember_token, :activation_token, :reset_token
  before_save :downcase_email
  before_save {self.first_name = first_name.capitalize}
  before_save {self.last_name = last_name.capitalize}
  name_regex = /\A[a-z]+\Z/i
  before_create :create_activation_digest
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :reg_no, presence: true, length: {maximum: 20}, uniqueness: true
  validates :gender, presence: true
  validates :department, presence: true
  
   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  DEPARTMENT = ["IT", "Computer Science"]
  # COURSE_TAKEN = ["IT", "Computer Science", "Network Security", "Information System"]
  GENDER = ["Male","Female"]

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def activate
    update_attribute(:activated, true)
    update_attribute(:activated_at, Time.zone.now)
  end

  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
