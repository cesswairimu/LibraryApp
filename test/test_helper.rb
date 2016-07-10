ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase


  fixtures :all
  

  #testing the behaviour if a user is logged in after signup 
  def is_logged_in?
    !session[:user_id].nil?

  end

end
