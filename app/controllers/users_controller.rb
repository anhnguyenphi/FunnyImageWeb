class UsersController < ApplicationController  
  before_action :signed_user, only: [:index,:edit, :update]
  before_action :corret_user, only: [:edit, :update]
  def index
    @title = "All user"
    @user = User.all
  end
  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
  	 @user = User.new
  	 @title = "Sign up"
  end
  def create
  	@user = User.new(name: user_params[:name], email: user_params[:email].downcase, 
                    password: user_params[:password], avatar: user_params[:avatar])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to lolApp!"
  		redirect_to @user
  	else
      @title = "Sign up"
  		render 'new'
  	end
  end
  def edit
    @title = "Edit"
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :avatar)
  end
  # check user signed in
  def signed_user
    unless signed_in
      flash[:danger] = "Please sign in"
      redirect_to signin_path
    end
  end
  # confirm corret user
  def corret_user
    @user = User.find(params[:id])
    redirect_to root_url unless @user == current_user
  end
end
