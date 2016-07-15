require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get book_path
    assert_response :success
  end

  test "should get add" do
    get book_url 
    assert_response :success
  end

end
