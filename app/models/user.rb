class User < ActiveRecord::Base
  attr_accessible :username, :password
  acts_at_authentic
end
