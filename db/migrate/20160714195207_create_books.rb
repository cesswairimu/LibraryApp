class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :category
      t.integer :quantity
      t.string :author
      t.string :publisher
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end