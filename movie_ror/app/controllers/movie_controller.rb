class MovieController < ApplicationController
  def new
  end

  def create
  	@movie = Movie.new(movie_params)
  end

  def show
  	if session[:user] == nil
      redirect_to main_login_path
    end
    @movie = Movie.all
  end

  def book
  	@mov = Movie.find(params[:bid])
    @user = User.find(params[:user][:id])
    uname = @user.uname
    mov = @mov.mname
    @bk = Bookmovie.where(:mname=> mov ,:uname => uname)
    if @bk.size == 0
      @bookmovie=Bookmovie.new
      @bookmovie.mname = @mov.mname
      @bookmovie.uname = @user.uname
      if @bookmovie.save
          list_group = Usergroup.where(:uname => params[:user][:uname],:status => 'A').uniq
          list_group.each { |x|  
          @message = Message.new
          @message.gname = x.gname
          @message.message = "The user "+ uname + " has booked for movie "+mov
          @message.save
        }
        redirect_to movie_show_path
      end
    else
      flash[:notice] = "You have already booked for this movie"
      redirect_to movie_show_path
    end
  end
end
