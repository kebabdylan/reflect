class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :entry
  attr_accessible :content, :user_id, :entry_id
end
