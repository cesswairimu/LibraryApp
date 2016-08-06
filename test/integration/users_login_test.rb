require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:cess)
  end

test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params:{
      session: { username: " ",    password: " "
      }
    }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_url
    assert flash.empty?
  end

  test "login with valid info and logout" do
    get login_path
    post login_path,params: {
     session: {
       username: @user.username, password:@user.password
     } 
     }
  end
  test "login with remembering user" do
    login_as(@user, remember_me: '1')
    assert_not_nil cookies['rem_token']
  end

    test "login without remembering user" do
    login_as(@user, remember_me: '0')
    assert_nil cookies['rem_token']
  end

end

