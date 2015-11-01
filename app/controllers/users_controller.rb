class UsersController < ApplicationController  
  def show
    @user = current_user
  end

  def new
  	 @user = User.new
  	 @title = "Sign up"
  end
  def create
  	@user = User.new(name: user_params[:name], email: user_params[:email].downcase, 
                    password: user_params[:password])
  	if @user.save
      sign_in @user
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
