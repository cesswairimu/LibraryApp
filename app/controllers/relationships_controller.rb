class RelationshipsController < ApplicationController

  def create
book = Book.find(params[:book_id])
current_user.borrow(book)
redirect_to books_path
  end

  def destroy
book = Relationship.find(params[:id]).borrowed
current_user.return(book)
redirect_to books_path
  end

end
