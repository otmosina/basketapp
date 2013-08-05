class BasketsController < ApplicationController
  def current_basket
  	@basket = current_user.user_basket
  end	

  def current_basket_buy
  	@basket = current_user.user_basket_buy
  	render :current_basket
  end	

  def delete_all_goods
  	current_user.user_basket.each(&:destroy)
  	redirect_to  basket_path
  end		

end	