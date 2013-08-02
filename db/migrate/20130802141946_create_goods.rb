class CreateGoods < ActiveRecord::Migration
  def self.up
    create_table :goods do |t|
      t.string :name
      t.integer :count
      t.integer :price
      t.timestamps
    end
  end

  def self.down
    drop_table :goods
  end
end
