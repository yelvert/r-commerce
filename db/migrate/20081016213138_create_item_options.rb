class CreateItemOptions < ActiveRecord::Migration
  def self.up
    create_table :item_options do |t|
      t.integer :item_id
      t.string :name
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :item_options
  end
end
