class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :balance
  acts_as_authentic

  has_many :baskets#, :class_name => "Corf"
  has_many :goods, :through => :baskets	


  def user_basket
  	type_basket(false)
  end	

  def user_basket_buy
  	type_basket(true)
  end  


  def add_good(good_var, count_add=1)

    if self.goods.include?(good_var) && 

  	unless self.goods.include? good_var
  	  self.goods << good_var
  	  basket_item = self.baskets.where(:good_id => good_var.id).first
  	  basket_item.update_attribute(:count, basket_item.count+count_add)
  	else
  	  	
  	end  
  end	

  def buy_all

  end	


  def type_basket(type_buy=false)	
  	result_array = []
  	self.baskets.where(:buy => type_buy).each do |item| 
  		new_obj = item.good
  		new_obj[:good_current] = item.count  
  		result_array << new_obj
  	end	
    return result_array 
  end	



end



#Покупатель
#Товары на складе