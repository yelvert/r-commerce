class CreateItemImages < ActiveRecord::Migration
  def self.up
    create_table :item_images do |t|
      t.column :item_id,  :integer
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.timestamps
    end
    add_column :items, :default_image_id, :integer
  end

  def self.down
    drop_table :item_images
    remove_column :items, :default_image_id
  end
end
