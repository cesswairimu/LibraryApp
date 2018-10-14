class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.date :due_date
      t.float :charges
      t.integer :status, default: 0
      t.index [:user_id, :book_id], unique: true

      t.timestamps
    end
  end
end
