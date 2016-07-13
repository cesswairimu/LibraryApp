module SessionsHelper
  # sets the session for the usser
  def log_in(user)
    session[:user_id] = user.id
  end

  #current_user for persistence
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(:remember, cookies[:rem_token])
        log_in user
        @current_user = user
      end
    end
  end

  # returns true if user is looged in
  def logged_in
    !current_user.nil?
  end
  #deletes the session created above
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil

  end
  #creating a user remember cookie
  def remember(user)
    user.remember
    cookies.signed[:user_id] = {value:user.id, expires: 7.days.from_now.utc }
    cookies[:rem_token] = {value: user.rem_token, expires: 7.days.from_now.utc }
  end

  #forgetting a perstitence session and delete cookies
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:rem_token)
  end
end
