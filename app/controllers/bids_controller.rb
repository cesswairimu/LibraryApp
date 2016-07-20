class BidsController < ApplicationController
  def new
    @bid = Bid.new
  end
  def create
    @bid = Bid.new(bid_params)
    if @bid.save
      flash[:success] = "Ceeeeeeeeeeeeeessssssssssssssssssssss!!!!!!!!!!!!!!!!!!!!"
      redirect_to books_path
    else
      flash[:danger] = "Problem requesting for a book"
      redirect_to books_path
    end
  end



  private

  def bid_params
    params.require(:bid).permit(:user_id, :book_id)
  end
end
