class MainController < ApplicationController

  	def login
  		if (request.method=="GET" )
  			@err=session[:uname]
			if(not session[:user].nil?)
				redirect_to main_login_path
			end
		#print form
			#setmessage()

		elsif (request.method=="POST")

			#session[:isadmin]=0
			@err=[]

			#user authenticate
			if(params[:uname].empty? or params[:password].empty?)
				@err.push("Fields can't be blank");
				flash[:notice_err] = "Fields can't be blank"
			end

			if(@err.size>0)
				session[:uname]=@err
				#flash[:notice] = "Fields can't be blank"
				flash[:notice_err] = "Fields can't be blank"
				redirect_to action:"login"
			else
			#check in db
				@us=User.where(:uname=>params[:uname])
				if( @us.size>0)
					@us=@us[0]
					if(@us.password==params[:password])
						session[:user]=@us
						redirect_to :controller =>"session",:action => "new",:user =>session[:user]
					else
						@err.push("Password Incorrect")
						flash[:notice_err] = "Password Incorrect"
						session[:uname]=@err
					 	redirect_to :action=>"login",:alert=> "Incorrect password"
					end	
				else
					@err.push("Invalid User. Please sign Up")
					flash[:notice_err] = "Invalid User. Please sign Up"
					session[:uname]=@err
					 redirect_to :action=>"login",:alert=> "Invalid User. Please sign Up"
				end
			end
		end
	end

end	
