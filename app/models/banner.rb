class Banner < ActiveRecord::Base
  attr_accessible  :image

  has_attached_file :image,
    # :path => ":rails_root/public/images/:id/:filename",
    # :url  => "/images/:id/:filename",

    :styles => {:large =>"800x360", :medium => "300x300>", :thumb => "100x100#",
    :default_url => '/assets/img_lich/lich_bloc.jpg' }
  #do_not_validate_attachment_file_type :image
  validates_attachment_content_type :image, :content_type => /image/
end