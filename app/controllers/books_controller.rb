class BooksController < ApplicationController
  def add
    @book = Book.new
  end
end
