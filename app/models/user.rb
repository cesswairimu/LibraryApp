class User < ApplicationRecord
  has_many  :relationships, class_name: "Relationship",
                            foreign_key: "borrowed_id",
                            dependent: :destroy
  has_many :books, through: :relationships, source: :borrowed
  has_many :bids
  #creating an accessible attribute for the digest
  attr_accessor :rem_token, :activation_token, :reset_token
  before_save :downcase_email
  before_save { self.username = username.downcase }
  before_create :create_activation_digest
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


  #converts all emails to downcase
  def downcase_email
    self.email = email.downcase
  end

  #creates and assigns activation digest and token
  def create_activation_digest
self.activation_token =  User.new_token
self.activation_digest = User.digest(activation_token)
  end
  #creating a new token method
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest, User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)

  end

  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end
  #defining  method for user remember token
  #use of self ensures a local variable is not used
  def remember
    self.rem_token  = User.new_token
    update_attribute(:remember_digest, User.digest(rem_token))
  end

  #returns true if given token matches digest
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    #comparing rem_token and digest
    BCrypt::Password.new(digest).is_password?(token)
  end

  #logout user and setting the remember_digest to nil(empty)
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
  def reset_expired?
    reset_sent_at < 3.hours.ago
  end
  #borrow a book
  def borrow
    relationships.create(borrowed_id: book.id)
  end

  #return a book to the lib
  def return(book)
    relationships.create(borrowed_id: book.id).destroy
  end

  #return true if a user has a certain book
  def books?(book)
    book.include?(book)
  end

end
