class BidsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]
  before_action :admin, only: [:index, :show, :release, :destroy]
  def new
    @bid = Bid.new
  end
  def create
    @bid = Bid.new(bid_params)
    begin
    if @bid.save
      flash[:success] = "You have requested for the #{@bid.book.title}"
      redirect_to books_path
    else
      flash[:info] = "Problem requesting for a book #{@bid.book.title}"
      redirect_to books_path
    end
    rescue
      flash[:danger] = "You've already requested for this book."
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
    due_date = 20.days.from_now
    book = Book.find(@bid.book_id)
    book.release.save
    @bid.update_attributes(status: "borrowed", due_date: due_date)
    @user = User.find_by(id: @bid.user_id)
    @user.send_release_email
    flash[:success] = "You have checked out this book"
    redirect_to bids_path
  end

  def destroy
    @bid = Bid.find(params[:id]).destroy
    book = Book.find(@bid.book_id)
    book.return.save
    flash[:info] = "Book was returned!!"
    redirect_to bids_path
  end
  def lost
    @bid = Bid.find(params[:bid_id])
    @bid.update_attributes(status: "lost", due_date: "2012")
    redirect_to root_url
    flash[:info] = "You have reported the loss of #{@bid.book.title}"

  end

  private

  def bid_params
    params.require(:bid).permit(:user_id, :book_id)
  end

end


