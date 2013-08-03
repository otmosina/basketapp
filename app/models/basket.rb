class Basket < ActiveRecord::Base
  attr_accessible :user_id, :good_id
  belongs_to :user
  belongs_to :good

  validate :count_goods

  def count_goods
  	errors.add(:count, "can't be equal zero") if  Good.find(self.good_id).count <= 0
  end 

  before_save :change_count_goods
  
  def change_count_goods
  	self.good.update_attribute(:count,self.good.count-1)
  end

end	