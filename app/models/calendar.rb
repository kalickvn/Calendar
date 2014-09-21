# coding: UTF-8
class Calendar < ActiveRecord::Base
  belongs_to :category
  has_many :orders
  attr_accessible :name,:paper_type,:box_type,:category_id,:is_deleted,:description,:photos_attributes
   has_many :photos, :dependent => :destroy
   accepts_nested_attributes_for :photos, allow_destroy: true
end