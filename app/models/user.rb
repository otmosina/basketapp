class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :balance
  acts_as_authentic

  has_many :baskets#, :class_name => "Corf"
  has_many :goods, :through => :baskets	

end