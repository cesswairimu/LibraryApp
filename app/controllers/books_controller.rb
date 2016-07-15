class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def add
    @book = Book.new(book_params)
    if @book.save
      flash[:info] = "Book added successfully"
      redirect_to new_url
    else
      render 'new'
    end
  end

  def show
    @book = Book.find_by(params[:id])

  end
  private
  def book_params
    params.require(:book).permit(:title, 
                                 :category, :quantity,
                                 :author, :publisher)
  end
end
