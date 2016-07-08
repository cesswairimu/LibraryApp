module SessionsHelper
  # sets the session for the usser
  def log_in(user)
    session[:user_id] = user.id
  end

  #defning the current user
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # returns true if user is looged in
  def logged_in
    !current_user.nil?
  end
  #deletes the session created above
def log_out
  session.delete(:user_id)
 @current_user = nil

end

end
