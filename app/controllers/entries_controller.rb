class EntriesController < ApplicationController
	before_filter :restrict

  def index

  @topics = Topic.all   
  
  if session[:is_admin]
	  @entries = Entry.all
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



  
  def update	
    @entry = Entry.find_or_create_by_topic_id_and_user_id( params[:topic], session[:userid])
  end


  def view	
    @entry = Entry.find_by_topic_id_and_user_id( params[:topic], session[:userid])

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
