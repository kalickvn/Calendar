module ApplicationHelper

def render_first_photo(photo)
  first_photo = photo.first
  if first_photo.blank?
    return "/assets/img_lich/lich_bloc.jpg"
  else
    return first_photo.image.url(:medium)
  end
end

end
