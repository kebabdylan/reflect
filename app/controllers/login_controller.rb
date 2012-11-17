class LoginController < ApplicationController
  # GET /comments
  # GET /comments.json
def index
    
    respond_to do |format|
      format.html # index.html.erb

    end
end
  


def login

end

def logout
  	session[:user] = nil
    session[:userid] = nil

	  flash[:msg] = "Goodbye, you have been logged out"
	  redirect_to "/login"
end

  
def authenticate
    session[:user] = nil
   
    @thisUser = User.authenticate(params[:email], params[:password])
    
	if params[:goto]
		goto_url = params[:goto]
	else
		goto_url = '/home'
	end
	
    if @thisUser
      @thisUser.tick
      session[:userid] = @thisUser.id
      session[:is_admin] = @thisUser.is_admin	  
	  #session[:is_admin] = true	  
	  flash[:msg] = "Welcome back, you have been logged in"
	    redirect_to goto_url
    else
      session[:user] = nil
	  flash[:msg] = "Username and password do not match"
		redirect_to "/login"
    end
    



end
end