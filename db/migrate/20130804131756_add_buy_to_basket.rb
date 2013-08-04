class AddBuyToBasket < ActiveRecord::Migration
  def change
  	add_column :baskets, :buy, :boolean, :default => false
  end
end
 