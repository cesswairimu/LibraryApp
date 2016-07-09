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
  
end
