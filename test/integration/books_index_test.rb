require 'test_helper'

class BooksIndexTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cess)
  end

  test "should show all books" do 
    assert login_as(@user)
    get books_path
    assert_template 'books/index'
  end
  test "should search by title" do
    skip
    assert login_as(@user)
    get books_path 
    get params: {
      search: {
      }
    }
  end
test "should request a book" do
  assert login_as(@user)
  get books_path
  assert_template 'books/index'
  get new_bid_path
  post params: { 
  bid: { book_id: 12 
  }}
end
end
