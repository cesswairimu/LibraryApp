require 'test_helper'

class PasswordResetsTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
    @user = users(:cess)
  end

  test "password resets" do
get new_password_reset_path
assert_template 'password_resets/new'
#for invalid username
post password_resets_path, params:{
  password_reset:
  { username: " " 
}
}
assert_not flash.empty?
assert_template 'password_resets/new'
#for valid username
post password_resets_path, params: {
  password_reset:{
   username: @user.username
}
}
assert_not_equal @user.reset_digest, @user.reload.reset_digest
assert_equal 1, ActionMailer::Base.deliveries.size
assert_not flash.empty?
assert_redirected_to root_url
#password reset form
user= assigns(:user)
#wrong username
get edit_password_reset_path(user.reset_token, username: "")
assert_redirected_to root_url
# Inactive user
 user.toggle!(:activated)
 get edit_password_reset_path(user.reset_token, username: user.username)
 assert_redirected_to root_url
 user.toggle!(:activated)
 # Right email, wrong token
 get edit_password_reset_path('wrong token', username: user.username)
 assert_redirected_to root_url
 # Right email, right token
 get edit_password_reset_path(user.reset_token, username: user.username)
 assert_template 'password_resets/edit'
 # Invalid password & confirmation
 patch password_reset_path(user.reset_token), params: {
 username: user.username,
user: { password:
 "foobaz",
 password_confirmation: "barquux" }
 }
 # Blank password
 patch password_reset_path(user.reset_token),
   params: {
 username: user.username,
 user: { password:
 " ",
 password_confirmation: "foobar" }
 }
 assert_not flash.empty?
 assert_template 'password_resets/edit'
 # Valid password & confirmation
 patch password_reset_path(user.reset_token),
   params: {
 username: user.username,
 user: { password:
 "lawrence",
 password_confirmation: "lawrence" }
 }
 assert is_logged_in?
 assert_not flash.empty?
 assert_redirected_to user
  end

end

