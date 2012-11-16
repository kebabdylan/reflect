class Topic < ActiveRecord::Base
  attr_accessible :active_on, :due_on, :questions, :title
end
