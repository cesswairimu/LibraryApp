require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get books_add_url
    assert_response :success
  end

end
