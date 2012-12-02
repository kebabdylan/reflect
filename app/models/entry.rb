class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments
  attr_accessible :content, :is_complete, :user_id, :topic_id
  
  validates_presence_of :user, :topic
  

  def self.get_active (userid)
    Entry.where("user_id = ? and is_complete <> 1",userid )
  end


  def link
  
  if self.is_complete
		  {:action=>"view", :label=>"View Entry"}
	  else
	    {:action=>"update", :label=>"Complete this entry now"}
	  end
  end
  
end
