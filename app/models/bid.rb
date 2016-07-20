class Bid < ApplicationRecord
  enum status: { requested: 0, borrowed: 1 }
  belongs_to :user
  belongs_to :book
end
