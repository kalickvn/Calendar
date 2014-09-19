class Category < ActiveRecord::Base
  attr_accessible :name,:description,:is_show_menu,:order_no
  validates_presence_of :name, :message =>"Loai khong dc bo trong"
  validates_presence_of :description  
end