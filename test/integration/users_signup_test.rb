require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  def setup
    @user = users(:cess)
  end
  #   assert true
  # end
  test "invalid sign_up information" do
    get signup_path
    assert_no_difference 'User.count' do
      post  users_path, user: { name: "   ", username: "cexy",
                           email: "cexy@her", password: "lawrence",
      password_confirmation: "terrence" }    
    end
    assert_template 'users/new'
  end
      
  test "sign_up with valid info" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name: "Cess", username: "cess",
                              email: "cess@gmail.com", password: "terrence",
                              password_confirmation: "terrence" }
    end
    assert_template 'users/show'
  end
    end
