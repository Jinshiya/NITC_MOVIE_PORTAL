class UserController < ApplicationController
  def show
  	
  end

  def create
  	@user = User.new(user_params)
  	
  end
  def create_user
  	#@user = User.new(user_params)
  end
  def save_user
  	@user = User.new
  	us_name = params[:uname]
  	@dup_user = User.where(:uname => us_name)
  	if @dup_user.size == 0
  		@user.uname = params[:uname]
  		@user.password = params[:password]
  		@user.name = params[:name]
  		if @user.save
  			flash[:notice] = "You can login to system now"
     	 	redirect_to main_login_path
     	 end
   	else
     	 	flash[:notice_err] = "Username already exist use your existing password to login"
     	 	redirect_to main_login_path
  	end
  end

  #private
 # def user_params
  #	params.require(:user).permit(:uname,:password,:name)
  #end
end
