class Basket < ActiveRecord::Base
  attr_accessible :user_id, :good_id
  belongs_to :user
  belongs_to :good

=begin
  validate :count_goods
  validate :balance_users

  def count_goods
  	errors.add(:count, "can't be equal zero") if  Good.find(self.good_id).count <= 0
  end

  def balance_users
  	errors.add(:balance, "not enough") if  Good.find(self.good_id).price > User.find(self.user_id).balance 
  end  

  before_save :change_count_goods
  before_save :change_balance_users
  
  def change_count_goods
  	self.good.update_attribute(:count,self.good.count-1)
  end

  def change_balance_users
	  self.user.update_attribute(:balance,self.user.balance - self.good.price)
  end	
=end

end	