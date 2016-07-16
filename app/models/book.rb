class Book < ApplicationRecord
#  belongs_to :user
  default_scope -> { order(id: :asc)  }
  validates :title, presence: true
  validates :author, presence: true
  validates :publisher, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
end
