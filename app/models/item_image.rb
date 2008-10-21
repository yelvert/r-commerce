class ItemImage < ActiveRecord::Base
  belongs_to :item
  
  has_attachment :content_type => :image, 
                   :storage => :file_system, 
                   :max_size => 5.megabytes,
                   :resize_to => '320x200>',
                   :thumbnails => { :thumb => '100x100>' },
                   :path_prefix => "/public/images/item_images"

  validates_as_attachment
  
  def default_image?(item=nil)
    self.id == item.default_image_id
  end
  
end
