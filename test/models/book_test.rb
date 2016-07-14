require 'test_helper'

class BookTest < ActiveSupport::TestCase
  def setup
    @book = Book.new(title: "Whale Rider", category: "Literature",
                    publisher: "Longhorn", author: "Cess Mbugua", quantity: 7 )
  end

  test "title should be present" do
    @book.title = ""
    assert_not @book.valid?
  end
 test "quantity should be present" do
    @book.quantity = ""
    assert_not @book.valid?
  end

 test "category should be present" do
    @book.category = ""
    assert_not @book.valid?
  end
 test "publisher should be present" do
    @book.publisher = ""
    assert_not @book.valid?
  end
 test "author should be present" do
    @book.author =  ""
    assert_not @book.valid?
  end

end
