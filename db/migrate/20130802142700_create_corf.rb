class CreateCorf < ActiveRecord::Migration
  def up
  	create_table :baskets do |t|
  	  t.integer :user_id
  	  t.integer :good_id	

  	  t.timestamps
  	end	
  end

  def down
  	drop_table :baskets 
  end
end
