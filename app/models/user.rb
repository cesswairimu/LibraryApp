class User < ApplicationRecord
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
end
