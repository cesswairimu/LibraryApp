class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only:[:edit, :update]
  def new
  end

  def edit
  end

  def create
    @user = User.find_by(username: params[:password_reset][:username])

    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash[:danger] = "No such username"
      render 'new'
    end
  end
  def get_user
    @user = User.find_by(username: params[:username])
  end

  def valid_user
  unless @user && user.activated? &&
    @user.authenticated?(:reset, params[:id])
    redirect_to root_url
  end
  end
end
