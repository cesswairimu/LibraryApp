class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def add
    @book = Book.new(book_params)
    if @user.save
      flash[:info] = "Book added successfully"
      redirect_to new_url
    else
      render 'new'
    end
  end
  private
  def book_params
    params.require(:book).permit(:title, 
                                 :category, :author,
                                :publisher, :quantity)
  end
end
