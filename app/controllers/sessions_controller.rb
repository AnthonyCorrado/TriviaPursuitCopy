class SessionsController < ApplicationController
  def new
  end

  def create
  	@user = User.where(:email => params[:session][:email]).first
  	if @user && @user.authenticate(params[:session][:password])
  		flash[:success] = "Hello, " + @user.name.capitalize + ", you have logged in!"
  		session[:remember_token] = @user.id
  		@current_user = @user
  		redirect_to bars_path
  	else
  		flash[:error] = "Invalid email/password combination. Please try again."
  		render 'new'
  		end
  	end

  def destroy
  	session.delete(:remember_token)
  	redirect_to bars_path
  end


  
end