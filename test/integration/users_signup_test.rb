require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  def setup
    ActionMailer::Base.deliveries.clear
  end
  #   assert true
  # end
  test "invalid sign_up information" do
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
    get signup_path
    assert_difference 'User.count', 1 do
    post users_path, params: {
      user: {
        name: "malach",
        username: "malach",
        email: "malach@gmail.com",
        password: "terrence",
        password_confirmation: "terrence"
      }
    }
  end
end
end
