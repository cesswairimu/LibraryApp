class Relationship < ApplicationRecord
  belongs_to :borrower, class_name: "User"
  belongs_to :borrowed, class_name: "Book"
  validates :borrower_id,  presence: true
  validates :borrowed_id,  presence: true

end
