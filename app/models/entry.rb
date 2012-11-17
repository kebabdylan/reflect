class Entry < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  attr_accessible :content
  
  validates_presence_of :user, :topic
  
  
end
