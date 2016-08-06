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
end
