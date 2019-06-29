class GroupController < ApplicationController
  def new
  end

  def create
  	@group = Group.new(group_params)
  end
  def show
    if session[:user] == nil
      redirect_to main_login_path
    end
  @user=User.find(params[:user][:id])
   names=@user.uname
  @group1=Group.where(Group.arel_table[:admin].does_not_match(names))
   if @group1.size == 0
      @group = Group.all
   else
      @group = @group1
    end
  end
  def join
  	@group = Group.find(params[:bid])
    @user = User.find(params[:user][:id])
    names=@user.uname
    gname=@group.id
    #@group1=Group.where(:id =>gname,:admin =>names)
    @usergroup1=Usergroup.where(:gname => gname , :uname =>names)

      if @usergroup1.size == 0
        @usergroup = Usergroup.new
        @usergroup.uname = @user.uname
        @usergroup.gname = @group.id
        @usergroup.status = 'P'
        if @usergroup.save
          flash[:success] = "Request sent to administrator"
          redirect_to action:"show",user:session[:user]
        end  
      else
        if @usergroup1[0].status == "P"
          flash[:failure] = "Your request is already pending with the administrator"
          redirect_to action:"show",user:session[:user]
        else
          if @usergroup1[0].status == 'R'
            @usergroup = Usergroup.new
            @usergroup.uname = @user.uname
            @usergroup.gname = @group.id
            @usergroup.status = 'P'
            if @usergroup.save
              flash[:success] = "Request sent to administrator"
              redirect_to action:"show",user:session[:user]
            end   
          else
             flash[:success] = "You are already a member of this group"
              redirect_to action:"show",user:session[:user]
          end  
        end
      end
    
   
  end
  
end
