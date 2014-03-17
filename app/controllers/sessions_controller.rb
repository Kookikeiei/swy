class SessionsController < ApplicationController
  def new
  	
  end

  def create
		user = User.authenticate params[:username],params[:password]
		
		if user == nil
            flash[:notice] = "Please enter valid information."
			redirect_to sessions_new_path
		end
	    if user != nil
		    if user.username == 'admin'
               session[:user_id] = user.id
               session[:admin] = '555'
			   flash[:notice] = 'Welcome back, ' + user.username + '!'
			   redirect_to admin_path 
			else
				 session[:user_id] = user.id
			  flash[:notice] = 'Welcome back, ' + user.username + '!'
			  redirect_to users_path 
		    end
        end
		
	end

	# DELETE logout action
	def destroy
		session[:user_id] = nil
		session[:admin] = nil
		flash[:notice] = "Log out successful"
		redirect_to root_path
	end

end
