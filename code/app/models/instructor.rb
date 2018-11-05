class Instructor < ApplicationRecord
  attr_accessor :remember_token, :reset_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence:   true, length: { maximum: 255 },
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = Instructor.new_token
    update_attribute(:reset_digest,  Instructor.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end
  
  # Sends password reset email.
  def send_password_reset_email
    InstructorMailer.password_reset(self).deliver_now
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = Instructor.new_token
    update_attribute(:remember_digest, Instructor.digest(remember_token))
  end
  
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
end