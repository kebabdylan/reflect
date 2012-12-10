class HomeController < ApplicationController

  # restrict to auth users
	before_filter :restrict

	def index
    @user = User.find(session[:userid])
	  
    entryIDs = Entry.where("user_id = ? and is_complete <> true",[session[:userid]]).map {|x| x.id}
	  
    #get entries that need to be completed  
    @active_entries = Entry.get_active(session[:userid])
    #get comments for this person
	  @comments = Comment.where(:entry_id=>entryIDs)
   
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @user }
    end
	
  end
	

	def topics
	
	@topics = Topic.all
    
	respond_to do |format|
      format.html # topics.html.erb
      format.json { render :json => @topic }
    end
	end
	
	

	def entries
		
	
	end
	
	

  
end