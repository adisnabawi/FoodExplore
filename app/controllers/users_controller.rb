class UsersController < ApplicationController
  helper_method :current_user, :logged_in?
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :current_user, only: [:edit, :update]
  
  def index
    @users = User.all
  end

  def show
  @user = User.find(params[:id])
  end
  
  def logged_in?
       current_user != nil
  end
  
  def new
  @user = User.new
  end
  
  def create
  @user = User.new(user_params)
  if @user.save
  log_in @user
  flash[:success] = "Finish updating!"
  redirect_to @user
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
    flash[:success] = "Profile updated"
    redirect_to @user 
  # Handle a successful update.
  else
  render 'edit'
  end
  end

  private
  
  def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  # Confirms a logged-in user.
  def logged_in_user
  unless logged_in?
  flash[:danger] = "Please log in."
  redirect_to login_url
  end
  end
end