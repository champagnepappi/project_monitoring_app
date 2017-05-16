class Lecturer < ApplicationRecord
  has_many :users
  has_many :replies , dependent: :destroy
  has_many :bids
  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "supervisor_id",
                                  dependent:  :destroy
  has_many :supervising, through: :active_relationships, source: :supervised
  enum status: {not_assigned: 0, assigned: 1}
  enum role: {lecturer: 0, admin: 1}
  attr_accessor :activation_token, :remember_token, :reset_token
  before_save {self.first_name = first_name.capitalize}
  before_save {self.last_name = last_name.capitalize}
  before_save :downcase_email
  before_create :create_activation_digest
  name_regex = /\A[a-z]+\Z/i
  validates :first_name, presence: true, length: {maximum: 40}, format: {with: name_regex}
  validates :last_name, presence: true, length: {maximum: 40}, format: {with: name_regex}

   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
     validates :email, presence: true,length: {maximum: 100},
           format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  has_secure_password
  validates :password, length: { minimum: 6 }, allow_blank: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def Lecturer.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def supervise(student)
    active_relationships.create(supervised_id: student.id)
  end

  def supervising?(student)
    supervising.include?(student)
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

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

  def create_reset_digest
    self.reset_token = Lecturer.new_token
    update_attribute(:reset_digest, Lecturer.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private
  def downcase_email
    self.email = email.downcase
  end

  def create_activation_digest
    self.activation_token = Lecturer.new_token
    self.activation_digest = Lecturer.digest(activation_token)
  end
end
