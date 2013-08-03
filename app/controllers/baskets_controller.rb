class BasketsController < ApplicationController
  def current_basket
  	@goods = current_user.goods

  end	

end	