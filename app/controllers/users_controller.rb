class UsersController < ApplicationController

  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :admin, only: [:index]
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @borrowed = Bid.where(status: "borrowed" , user_id: @user.id)
    @losts = Bid.where(status: "lost" , user_id: @user.id)
  end

  def index
    add_breadcrumb "index", index_path, :title => "Back to the Index"
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Check your email to activate account"
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
