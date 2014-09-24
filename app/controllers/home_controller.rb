# This controller is used to process and render home page
# History: June 06, 2013
# By NamTV

class HomeController < ApplicationController
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
    @categories = Category.order("order_no").limit(4)
    @home_intro =Setting.where(:code => Setting::CODE_ATTR[:HOME_INTRO].to_s).first
  end
  def introduction
    @page_intro =Setting.where(:code => Setting::CODE_ATTR[:INTRO_FIELD].to_s).first
  end
  
  def pricing_page
    @page_intro =Setting.where(:code => Setting::CODE_ATTR[:PRICING_FIELD].to_s).first
  end
end