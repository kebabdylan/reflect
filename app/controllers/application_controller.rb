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

  def setup
    
    # create admin user
    #me = User.new
    #me.first_name = "Jonathan"
    #me.last_name = "Arp"
    #me.email="jarp@nd.edu"
    #me.is_admin = true
    #me.password="farkle"
    #me.save
  
    #create a topic
    #topic = Topic.new
    #topic.title = "Why are you here?"
    #topic.questions = "Why are you taking this class? What do you hope to get out of it?"
    #topic.due_on='1/20/2013'
    #topic.active_on='12/1/2012'
    
  
  
  
  end
  
  

end
