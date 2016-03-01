class SessionUserController < ApplicationController
  def new
  	if signed_in
  	  redirect_to topics_path
  	else
  	  @title = "Sign in"
  	end
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)

  	if user && user.authenticate(params[:session][:password])
  		sign_in(user)
  		params[:session][:remember] == '1' ? remember(user) : forget(user)
  		redirect_to topics_path
  	else
  		@title = "Sign in"
  		flash.now[:danger] = 'nvalid email or password'
  		render 'new'
  	end
  end

  def destroy
  	sign_out if signed_in
  	redirect_to root_url
  end
end
