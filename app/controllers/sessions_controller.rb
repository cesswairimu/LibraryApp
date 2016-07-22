class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      if user.activated?
      log_in user
      #handling submission of the remember token
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      message = "Account not activated"
      message += "Check your email for  activation"
      flash.now[:warning] = message
      redirect_to root_url
    end
    else
      flash.now[:danger] = "Incorrect username/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in
    redirect_to root_url
  end

end
