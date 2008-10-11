# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def price_to_string(price)
    str_price = price.to_s.split('.')
    dollars = str_price[0]
    cents = str_price[1]
    str = "#{dollars}."
    case cents.length
      when 0
        str += "00"
      when 1
        str += "#{cents}0"
      else
        str ="#{dollars.to_f+"0.#{cents}".to_f.to_precision}"
    end
    str
  end
  
end
