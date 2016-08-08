class Bid < ApplicationRecord
  enum status: { requested: 0, borrowed: 1, 
  returned: 2, lost: 3, account: 4}
  belongs_to :user
  belongs_to :book
end
