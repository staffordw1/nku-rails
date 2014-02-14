class Student < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :attendances
  
  def in_seat(seat, attended_on)
    
  end
  
  def absent(attended_on)
    
  end
end
