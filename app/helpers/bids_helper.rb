module BidsHelper
  def days_remaining(bid)
    #if bid.due_date.future?
      unless bid.due_date.nil?
        distance_of_time_in_words( Time.zone.now, bid.due_date )
      end
  end

end
