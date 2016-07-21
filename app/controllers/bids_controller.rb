class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end
  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      flash[:success] = "Ceeeeeeeeeeeeeessssssssssssssssssssss!!!!!!!!!!!!!!!!!!!! "
      redirect_to books_path
    else
      flash[:danger] = "Problem requesting for a book"
      redirect_to books_path
    end
  end
  def index
    @requests = Bid.requested
    @releases = Bid.borrowed
  end

  def show
    @bid = Bid.find(bid_params)
  end

  def release
    @bid = Bid.find(params[:bid_id])
    @bid.update_attribute(:status, params[:status])
    flash[:success] = "You have checked out this book"
    redirect_to bids_path
  end



  private

  def bid_params
    params.require(:bid).permit(:user_id, :book_id)
  end
end
