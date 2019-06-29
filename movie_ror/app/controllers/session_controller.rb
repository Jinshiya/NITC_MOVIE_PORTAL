class SessionController < ApplicationController
  def new
  	if session[:user] == nil
      redirect_to main_login_path
    end
    @user =User.find(params[:user])
    @uname = @user.name
  end

  def create
  end

  def destroy
  	#User.find(session[:user]).destroy
  	session[:user] = nil
  	redirect_to main_login_path
  end
end
