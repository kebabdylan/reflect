class HomeController < ApplicationController

	before_filter :restrict

  # GET /comments
  # GET /comments.json
	def index

	@user = User.find(session[:userid])
	entryIDs = Entry.where("user_id = ? and is_complete <> 1",[session[:userid]]).map {|x| x.id}
	@entries = Entry.where("user_id = ? and is_complete <> 1",[session[:userid]])
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