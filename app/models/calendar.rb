class Calendar < ActiveRecord::Base
  attr_accessible :name,:paper_type,:box_type,:category_id,:is_deleted,:description
end