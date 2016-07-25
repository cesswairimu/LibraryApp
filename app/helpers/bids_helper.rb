module BidsHelper
  def days_remaining(bid)
    bid.due_date = 20.days.from_now
   # if bid.due_date.future?
      unless bid.due_date.nil?
        distance_of_time_in_words(Time.zone.now, bid.due_date)
      end
  end

end
