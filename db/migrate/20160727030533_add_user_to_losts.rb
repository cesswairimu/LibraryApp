class AddUserToLosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :losts, :user, foreign_key: true
  end
end
