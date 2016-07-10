class User < ApplicationRecord
  #creating an accessible attribute for the digest
  attr_accessor :rem_token
  before_save { self.email = email.downcase }
  before_save { self.username = username.downcase }
  VALID_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, length: { maximum: 30 }, 
    uniqueness: true, format: { with: VALID_REGEX }
  has_secure_password
  validates :password, length: { minimum: 6 }

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #creating a new token method
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #defining  method for user remember token
  #use of self ensures a local variable is not used
  def remember
    self.rem_token  = User.new_token
    update_attribute(:remember_digest, User.digest(rem_token))
  end

  #returns true if given token matches digest
  def authenticated?(rem_token)
    #comparing rem_token and digest
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #logout user and setting the remember_digest to nil(empty)
  def forget
    update_attribute(:remember_digest, nil)
  end
end
