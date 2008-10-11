class Cart < ActiveRecord::Base
  
  def items
    items = Array.new
    self.item_ids.split(',').each {|x| items << Item.find(x)}
    items
  end
end
