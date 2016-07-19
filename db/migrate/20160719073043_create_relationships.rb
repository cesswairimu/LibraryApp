class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :borrower_id
      t.integer :borrowed_id

      t.timestamps null: false
    end
    add_index :relationships, :borrower_id
    add_index :relationships, :borrowed_id
    add_index :relationships, [:borrower_id, :borrowed_id], unique: true
  end
end
