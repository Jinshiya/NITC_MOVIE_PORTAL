class UsergroupController < ApplicationController
  def create
  end
  def show
    if session[:user] == nil
      redirect_to main_login_path
    end
  	@user = User.find(params[:uname][:id])
  	name = @user.uname
  	@group = Group.where(:admin => name)
  	gname = @group.find(@group.ids)
  	#@g = Group.find(gname)
  	#gn =g.gname
  	@ugroup = Usergroup.where(:gname => gname , :status => 'P' )
  end 
  def approve
  	 @group = Group.find(params[:gname])
  	 gnm = @group.id
     @user = User.where(:uname => params[:user])
     @user = @user[0]
     uname = @user.uname
  	 @usergroup = Usergroup.where(:gname => gnm,:uname => uname,:status => 'P')
     
     @usergroup.each do |x|
        x.status = "A"
        x.save
  	 end
     flash[:success] = "Request Accepted"
     redirect_to action:"show",uname:session[:user]

  end
  def reject
     @group = Group.find(params[:gname])
     gnm = @group.id
     @user = User.where(:uname => params[:user])
     @user = @user[0]
     uname = @user.uname
     @usergroup = Usergroup.where(:gname => gnm,:uname => uname)
     
     @usergroup.each do |x|
        x.status = "R"
        x.save
     end
     flash[:success] = "Rejection done"
     redirect_to action:"show",uname:session[:user]

  end
end
