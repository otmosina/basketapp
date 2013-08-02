class CreateCorf < ActiveRecord::Migration
  def up
  	create_table :corfs do |t|
  	  t.integer :user_id
  	  t.integer :good_id	

  	  t.timestamps
  	end	
  end

  def down
  	drop_table :corfs 
  end
end
