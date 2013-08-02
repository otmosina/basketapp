class Good < ActiveRecord::Base
  attr_accessible :name, :count, :price
  has_many :users, :through => :corfs
end
