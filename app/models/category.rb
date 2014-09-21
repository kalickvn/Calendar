# coding: UTF-8
class Category < ActiveRecord::Base
  attr_accessible :name,:description,:is_show_menu,:order_no
  validates_presence_of :name, :message =>"Tên loại lịch không được bỏ trống."
  validates_presence_of :description 
  has_many :calendars 
end