class Item < ActiveRecord::Base
  belongs_to :category
  has_many :item_images
  has_many :item_options
  
  validates_presence_of :name, :price, :description
  
  def default_image
    ItemImage.find(self.default_image_id)
  end
  
end
