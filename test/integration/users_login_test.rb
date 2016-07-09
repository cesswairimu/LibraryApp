require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { username: " ",    password: " "}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_url
    assert_not flash.empty?
  end

  test "login with valid info" do
    get login_path
    post login_path, session: { username: "Cess", password: "terrence" }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", users_path(@user)
  end

end

