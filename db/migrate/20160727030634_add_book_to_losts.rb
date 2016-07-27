class AddBookToLosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :losts, :book, foreign_key: true
  end
end
