class Book < ApplicationRecord
  has_many :relationships, class_name: "Relationship",
                           foreign_key: "borrowed_id",
                           dependent: :destroy
  #has_many :borrowers, through: :relationships, source: :borrower
  has_many :users
  default_scope -> { order(id: :asc)  }
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :quantity, presence: true, numericality: true
  validates :category, presence: true
end
