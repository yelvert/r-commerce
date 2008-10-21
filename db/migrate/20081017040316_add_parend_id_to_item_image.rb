class AddParendIdToItemImage < ActiveRecord::Migration
  def self.up
    add_column :item_images, :parent_id, :integer
  end

  def self.down
    remove_column :item_images, :parent_id
  end
end
