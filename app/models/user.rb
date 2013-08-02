class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :balance
  acts_as_authentic

  has_many :corfs
  #has_many :goods, :through => :corfs

end