require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Ceciliah", username: "@Cessy", email: "cessmkali@wew.com", 
                    password: "terrence", password_confirmation: "terrence")
  end


test " username should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
end

test "username should be present" do
  @user.username = ""
  assert_not @user.valid?
end

test "name should be present" do
  @user.name = ""
  assert_not @user.valid?
end

test "email should length not big" do
  @user.email = "a" * 50 + "@example.com"
  assert_not @user.valid?
end

test "email addresses should be unique" do
  duplicate_user = @user.dup
  @user.save
  assert_not duplicate_user.valid?
end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
