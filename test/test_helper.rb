ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase


  fixtures :all


  #testing the behaviour if a user is logged in after signup 
  def is_logged_in?
    !session[:user_id].nil?

  end
  # login a test user
  def login_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: { username: user.username,
                                  password: password,
                                  remember_me: remember_me }
    else
      session[:user_id] = user_id
    end
  end
  private
  #true inside integration test
  def integration_test?
    defined?(post_via_redirect)
  end
end
