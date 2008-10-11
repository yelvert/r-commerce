class CreateCarts < ActiveRecord::Migration
  def self.up
    create_table :carts do |t|
      t.string :session_id
      t.text :item_ids

      t.timestamps
    end
  end

  def self.down
    drop_table :carts
  end
end
