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
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    #click logout in a second window
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path 
    assert_select "a[href=?]", logout_path, count: 0
    assert_select "a[href=?]", users_path(@user), count: 0
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

