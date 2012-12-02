class EntriesController < ApplicationController
  #only allow auth users
	before_filter :restrict

  def index

    @topics = Topic.all   
  
    if session[:is_admin]
      @entries = Entry.where("is_complete not null and user_id <> ?",  session[:userid])
    else
  	  @entries = Entry.where("user_id = ?", session[:userid])
    end
	
		
	  if params.has_key? "pop"
	    render :layout => "minimal"
      end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @entries }
    end
    
  end



  def saveComment
    params[:user_id] = session[:userid]
    @comment = Comment.new(params[:comment])
    @comment.save
    render :json => @comment
  end


  def comments
    @comments = Comment.where("entry_id = ?", params[:entry_id]) 

    respond_to do |format|
      format.html {render :layout=>'xhr'}
      format.json { render :json => @comments }
    end
  end




  
  def update	
    @entry = Entry.find_or_create_by_topic_id_and_user_id( params[:topic], session[:userid])
  end


  def view	
    
    if params.has_key?("userid")
        @entry = Entry.find_by_topic_id_and_user_id( params[:topic], params[:userid])
    else
        @entry = Entry.find_by_topic_id_and_user_id( params[:topic], session[:userid])
    end
    
    @comment = Comment.new
    @comment.entry_id = @entry.id
    @comment.user_id = session[:userid]


  	if params.has_key? "pop"
  		render :layout => "minimal"
  	end

  end


  def save
    @entry = Entry.find_or_create_by_topic_id_and_user_id( params[:topic], session[:userid])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to "/entries", :notice => 'Entry was successfully updated.' }
        flash[:msg] = "You have updated '#{@entry.topic.title}' successfully"
        format.json { head :no_content }
      else
        format.html { render :action => "update" }
        format.json { render :json => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end



  def delete
	  @entry = Entry.find_by_id_and_user_id( params[:eid], session[:userid]) 
    @entry.destroy

	  flash[:msg] = "Entry has been deleted"
 	  redirect_to "/entries" 
  end


 end
