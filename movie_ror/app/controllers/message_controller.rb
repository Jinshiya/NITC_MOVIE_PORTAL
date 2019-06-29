class MessageController < ApplicationController
  def show
    if session[:user] == nil
      redirect_to main_login_path
    end
  	@user = User.find(params[:uname][:id])
  	name = @user.uname
  	i = 0
  	gname=[]
  	@ugroup = Usergroup.where(:uname => name,:status => 'A')
  	@ugroup.each do |e|  
  		gname[i]=e.gname
  		i=i+1
  	end
  	#gname = @ugroup.find(@ugroup.gname)
  	@msg = Message.where(:gname =>gname)
  end
end
