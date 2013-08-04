class Good < ActiveRecord::Base
  attr_accessible :name, :count, :price
  has_many :baskets#, :class_name => "Corf"
  has_many :users, :through => :baskets

  #scope :in_stock, where('count != 0')
end
