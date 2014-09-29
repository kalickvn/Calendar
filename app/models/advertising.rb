# coding: UTF-8
require 'uri'
class Advertising < ActiveRecord::Base
  
  attr_accessible  :image,:link,:order_no,:is_deleted
  has_attached_file :image,
    :styles => {:large =>"800x360", :medium => "300x300>", :thumb => "100x100#",
    :default_url => '/assets/img_lich/lich_bloc.jpg' }
  validates_attachment_content_type :image, :content_type => /image/
  validates_format_of :link, :with => URI::regexp(%w(http https)),:message =>" không hợp lệ."
end