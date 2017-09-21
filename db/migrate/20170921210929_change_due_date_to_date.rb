class ChangeDueDateToDate < ActiveRecord::Migration[5.0]
  def change 
    change_column :bids, :due_date, :date
  end
end
