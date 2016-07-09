require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path session: { username: " ",    password: " "}
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_url
    assert_not flash.empty?
  end

end
