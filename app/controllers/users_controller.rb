class UsersController < ApplicationController  
  def show
  	@user = User.find(params[:id])
  end

  def new
  	 @user = User.new
  	 @title = "Sign up"
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
      flash[:success] = "Welcome to lolApp!"
  		redirect_to @user
  	else
      @title = "Sign up"
  		render 'new'
  	end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password)
  end
end
