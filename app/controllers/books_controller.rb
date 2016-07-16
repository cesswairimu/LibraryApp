class BooksController < ApplicationController

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
  private
  def book_params
    params.require(:book).permit(:title, 
                                 :category, :quantity,
                                 :author, :publisher)
  end
end
