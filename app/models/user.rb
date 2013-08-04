class User < ActiveRecord::Base
  attr_accessible :username, :email, :password, :password_confirmation, :balance
  acts_as_authentic

  has_many :baskets#, :class_name => "Corf"
  has_many :goods, :through => :baskets	


  def user_basket
  	type_basket(false)
  end	

  def all_price_in_basket
    sum = 0
    user_basket.each do |item|
      sum += item.good.price*item.count
    end  
    return sum 
  end  

  def user_basket_buy
  	type_basket(true)
  end  

  def user_basket_goods
    self.user_basket.map(&:good)
  end

  def user_basket_buy_goods
    self.user_basket_buy.map(&:good)
  end    


  def add_good(good_var, count_add=1)

    if good_var.count >= count_add 
      self.goods << good_var unless self.user_basket_goods.include?(good_var)      
      basket_item = self.baskets.where(:good_id => good_var.id , :buy => false).first
      basket_item.update_attribute(:count, basket_item.count+count_add)
      return true
    else
      return false
    end  

  end	
  


  def buy_all
    if self.balance >= self.all_price_in_basket
      self.user_basket.each do |item|
        item.update_attribute(:buy, true)
        item.good.update_attribute(:count, item.good.count - item.count)
      end  
      return true
    else
      return false
    end
  end	


  def type_basket(type_buy=false)	
    self.baskets.where(:buy => type_buy)
  end	



end



#Покупатель
#Товары на складе