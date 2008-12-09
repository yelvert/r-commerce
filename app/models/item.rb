class Item < ActiveRecord::Base
  belongs_to :category
  has_many :item_images
  has_many :item_options
  has_many :cart_items
  has_many :carts, :through => :cart_items
  
  validates_presence_of :name, :price, :description
  
  def default_image
    ItemImage.find(self.default_image_id)
  end
  
end
