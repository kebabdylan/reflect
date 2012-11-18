class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :comments
  attr_accessible :content, :is_complete, :user_id, :topic_id
  
  validates_presence_of :user, :topic
  




  def link
  
  if self.is_complete
		  {:action=>"view", :label=>"View Entry"}
	  else
	  	  {:action=>"update", :label=>"Complete this entry now"}
	  end
  end
  
end
