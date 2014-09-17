class Category < ActiveRecord::Base
  attr_accessible :name,:description,:is_show_menu,:order_no
  
end