# This controller is used to process and render home page
# History: June 06, 2013
# By NamTV

class CalendarsController < ApplicationController
  skip_authorize_resource

  ##
  #Get user list except an user with specify ID
  #Parameters::
  #Return::
  # * login page if !current_user and home#index if current_user
  #*Author*:: NamTV
  def index
    # if !current_user
    #   flash[:notice] = flash[:notice]
    #   redirect_to new_user_session_path
    #   return
    # end
    # redirect_to after_sign_in_path_for(current_user)
    params["category_id"] = 1
    page = params["page"] || 1
    per_page = params["per_page"] || 10
    @list_calendars = Calendar.where(:category_id => params["category_id"]).paginate(:page => page,:per_page => per_page)
    @list_calendars = [1,2,3,4,5,6]
    @categories = Category.all
  end
  
  def show
      
  end

  def contact
    
  end

  def send_contact
    
  end

  def product_contact
    
  end
  
  def send_product_contact
    
  end
end