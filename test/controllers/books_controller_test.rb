require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get book_path
    assert_response :success
  end

end
