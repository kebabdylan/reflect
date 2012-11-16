class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :is_admin, :last_login, :last_name, :login_count, :password
  
  has_many :entries
  



  def self.authenticate(email, password)
    self.find(:first, :conditions => ["email = ? and password = ?", email, password])
  end



  def tick 
    self.login_count = self.login_count.to_i + 1
    self.last_login = Time.now
    self.save
    

  end 



end
