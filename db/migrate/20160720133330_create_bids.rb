class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.datetime :due_date
      t.float :charges
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
