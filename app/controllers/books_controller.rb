class BooksController < ApplicationController
  before_action :logged_in_user, only: [:index]
  before_action :admin_user, except: [:index]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:info] = "Book added successfully"
      redirect_to new_book_path
    else
      render 'new'
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book has been changed"
      redirect_to books_url
    else

      flash.now[:danger] = "Error editing book"
      render 'edit'
    end
  end
  #destroy a  book
  def destroy
    Book.find(params[:id]).destroy
    flash[:info] = "Book has been deleted"
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, 
                                 :category, :quantity,
                                 :author, :publisher)
  end

  def admin_user
     unless admin
       redirect_to books_url
       flash.now[:danger] = "You are not allowed to perform this action"
     end
  end
end
