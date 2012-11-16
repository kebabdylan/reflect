class EntriesController < ApplicationController


  def index

@topics = Topic.all   
  if session[:is_admin]
	  @entries = Entry.all

  else
	  @entries = Entry.where("user_id = ?", session[:userid])
  end
	
	

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @entries }
    end
  end




  def update	
    @entry = Entry.find_or_create_by_topic_id_and_user_id( params[:topic], session[:userid])
  end



  def save
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to "/entries", :notice => 'Entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

 end
