class Student < ActiveRecord::Base
  include Gravtastic
  gravtastic
  
  has_secure_password
  validates_presence_of :password, :on => :create
end
