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
      flash[:danger] = "Problem requesting for a book #{@bid.book.title}"
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
    book = Book.find(@bid.book_id)
    book.release.save
    @bid.update_attribute(:status, params[:status])
    @bid.update_attribute(:due_date, params[:due_date])
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
  private

  def bid_params
    params.require(:bid).permit(:user_id, :book_id)
  end
end
