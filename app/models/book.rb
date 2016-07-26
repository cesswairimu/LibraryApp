class Book < ApplicationRecord
  has_many :users
  has_many :bids
  default_scope -> { order(id: :asc)  }
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :quantity, presence: true, numericality: true
  validates :category, presence: true

  def release
    decrement(:quantity, 1)
  end

  def return
    increment(:quantity, 1)
  end


  def self.search(search)
    where("title  like ?", "%#{search}%") 
  end


end
