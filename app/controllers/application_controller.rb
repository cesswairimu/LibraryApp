class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper


  #require a user to be logged in
  def logged_in_user
    unless logged_in
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  #Flash if current user is not admin
  def admin
    unless current_user.admin?
      redirect_to root_url
      flash[:danger] = "You have no access here"
    end
  end

end

