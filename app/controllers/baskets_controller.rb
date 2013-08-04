class BasketsController < ApplicationController
  def current_basket
  	@basket = Basket.where(:user_id => current_user.id)
  	@goods = current_user.user_basket
  end	

  def delete_all_goods
  	Basket.where(:user_id => current_user.id).each(&:destroy)
  	redirect_to  basket_path
  end		

end	