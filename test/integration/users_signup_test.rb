require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  def setup
    ActionMailer::Base.deliveries.clear
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
    assert_difference 'User.count', 1 do
    post users_path, params: {
      user: {
        name: "Cess",
        username: "cess",
        email: "cess@gmail.com",
        password: "terrence",
        password_confirmation: "terrence"
      }
    }
  end
  assert_equal 1, ActionMailer::Base.deliveries.size
  user = assigns(:user)
  assert_not user.activated?
  # Try to log in before activation.
  log_in_as(user)
  assert_not is_logged_in?
  # Invalid activation token
  get edit_account_activation_path("invalid token")
   assert_not is_logged_in?
   # Valid token, wrong email
   get edit_account_activation_path(user.activation_token, email: 'wrong')
   assert_not is_logged_in?
   # Valid activation token
   get edit_account_activation_path(user.activation_token, email: user.email)
   assert user.reload.activated?
  follow_redirect!
  assert_template 'users/show'
   assert is_logged_in?
  end
end
