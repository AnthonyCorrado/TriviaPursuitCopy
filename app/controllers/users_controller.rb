class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome, " + @user.name.capitalize + ", you may now start your pursuit of trivia!"
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to bars_path

    else
      render :new
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
  
end