require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  def setup
    @user = users(:cess)
  end
  #   assert true
  # end
  test "invalid sign_up information" do
    skip
    get signup_path
    assert_no_difference 'User.count' do
      post  users_path, params: {
        user: {
          name: "   ", username: "cexy",
          email: "cexy@her",
          password: "lawrence",
          password_confirmation: "terrence" 
        }
      }
    end
    assert_template 'users/new'
  end

  test "sign_up with valid info" do
    skip
    get signup_path
    first_count = User.count
    post users_path, params: {
      user: {
        name: "Cess",
        username: "cess",
        email: "cess@gmail.com",
        password: "terrence",
        password_confirmation: "terrence"
      }
    }
    debugger
    second_count = User.count
    assert_not_equal first_count, second_count
    # follow_redirect!
    # assert_template 'users/show'
  end
end
