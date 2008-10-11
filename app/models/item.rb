class Item < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of :name, :price, :description
  
end
