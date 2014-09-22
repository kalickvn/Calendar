class Photo < ActiveRecord::Base
  attr_accessible  :calendar_id, :image

  belongs_to :calendar

  has_attached_file :image,
    # :path => ":rails_root/public/images/:id/:filename",
    # :url  => "/images/:id/:filename",

    :styles => {:large =>"800x360", :medium => "300x300>", :thumb => "100x100#",
    :default_url => '/assets/img_lich/lich_bloc.jpg' }
  do_not_validate_attachment_file_type :image
end