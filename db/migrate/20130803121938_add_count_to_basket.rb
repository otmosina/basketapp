class AddCountToBasket < ActiveRecord::Migration
  def change
  	add_column :baskets, :count, :integer, :default => 0
  end
end
