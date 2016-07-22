class AddIndexToBids < ActiveRecord::Migration[5.0]
  def change
    add_index :bids, [:user_id, :book_id], unique: true
  end
end
