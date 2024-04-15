class User < ApplicationRecord
  attr_accessor :remember_token

  before_save { email.downcase! }

  VALID_NAME_REGEX = /\A[a-zA-Z][\w\s'\-]*\z/
  validates :name, presence: true, length: { maximum: 50, message: "cannot be more than 50 characters" },
            format: { with: VALID_NAME_REGEX,
                      message: "must start with a letter and can only contain letters, numbers, spaces, underscores, dashes, and apostrophes" }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255, message: "cannot be over 255 characters" },
            format: {with: VALID_EMAIL_REGEX, message: "must be a valid email"},
            uniqueness: { case_sensitive: false }

  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*+=]).{1,}\z/

  validates :password, presence: true, length: { minimum: 8, message: "must be at least 8 characters long" },
            allow_nil: true, format: {with: VALID_PASSWORD_REGEX,
                                      message: "must contain at least one lowercase character, an uppercase character, a digit, and a special character"}

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    remember_digest
  end

  def session_token
    remember_digest || remember
  end

    # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end
end
