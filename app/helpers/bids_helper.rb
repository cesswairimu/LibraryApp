module BidsHelper
  def days_remaining(bid)
    bid.due_date = Time.now + 20.days
  end

end
