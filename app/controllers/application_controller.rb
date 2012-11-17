class ApplicationController < ActionController::Base
  protect_from_forgery

  def restrict_to_admin
	unless session[:is_admin]
		flash[:msg] = "You must be an admin [#{session[:is_admin]}] in to access that resource"
		redirect_to "/login" 
	end  
  end
  
  def restrict
  	unless session[:userid]
  		flash[:requested_url] = "#{params[:controller]}/#{params[:action]}"
  		flash[:msg] = "You must be logged in to access that resource"
  		redirect_to "/login" 
  	end
  end	


end
