# coding: UTF-8
class Order < ActiveRecord::Base
  belongs_to :calendar
  attr_accessible :name,:address,:phone,:calendar_id,:note,:email,:quantity
  validates_presence_of :name, :message =>" không được bỏ trống."
  validates_presence_of :phone, :message =>" không được bỏ trống."
  validates_presence_of :email, :message =>" không được bỏ trống."
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:message =>" sai định dạng."
end