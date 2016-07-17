class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update]
  before_action :admin, only: [:index]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @books = Book.all
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Check your email to activate account"
      #login user after sign up
      # log_in @user
      #flash[:success] = "Welcome to our Library"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "You just updated your profile!!!"

      redirect_to @user
    else
      render 'edit'
    end
  end




  private
  
  def user_params
    params.require(:user).permit(:name, :username, :email, :password,
                                 :password_confirmation)
  end
end
