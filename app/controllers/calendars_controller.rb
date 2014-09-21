# coding: UTF-8
# This controller is used to process and render home page
# History: June 06, 2013
# By NamTV

class CalendarsController < ApplicationController
  skip_authorize_resource
  layout "admin",:only =>[:admin,:new,:edit]
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
    @categories = Category.find(params["category_id"])
    redirect_to root_path and return  if params["category_id"].blank? || @categories.blank?
    page = params["page"] || 1
    per_page = params["per_page"] || 10
    @list_calendars = Calendar.where(:category_id => params["category_id"]).paginate(:page => page,:per_page => per_page)
    
  end
  
  def show
    @calendar = Calendar.includes(:photos).find(params[:id])
  end

  def contact
    
  end

  def send_contact
    @flash = []
    @flash << "Họ và tên không được bỏ trống." if params["contact[name]"].blank? 
    @flash << "Chủ đề không được bỏ trống." if params["contact[subject]"].blank?
    @flash << "Nội dung không được bỏ trống." if params["contact[content]"].blank?  
    @flash << "Email không được bỏ trống." if params["contact[email]"].blank?
    if flash[:errors].blank?
      Notifier.contact_email(params["contact"]).deliver
    else
      render :contact
    end
  end

  def product_contact
    @calendar = Calendar.includes(:photos).find(params[:calendar_id])
    @order = Order.new
  end
  
  def send_product_contact
    
  end

  def admin
    if request.xhr?
      per_page = params[:iDisplayLength] ||  10
      page = params[:iDisplayStart] ? ((params[:iDisplayStart].to_i/per_page.to_i) + 1) : 1
      search_text = params["sSearch"] || ""
      cols = ["name","size","description","categories.name"]
      select = "calendars.id,calendars.name, calendars.size,calendars.description,categories.name as category_name"
      sort_field =  cols[(params[:iSortCol_0].to_i)] + " " + params[:sSortDir_0].to_s
      @calendars = Calendar.joins(:category).order(sort_field).select(select).paginate(:per_page => per_page,:page =>page)
      render :json => {"aaData" => @calendars,"iTotalRecords"=>@calendars.length,"iTotalDisplayRecords"=>@calendars.length}
    end
  end

  def new
    @calendar = Calendar.new
    @categories = Category.all
  end
  def edit
    @calendar = Calendar.includes(:photos).find(params[:id])
    @categories = Category.all

  end

  def update
    @gallery = Calendar.find(params[:id])
    if @gallery.save
      if params[:images]
          params[:images].each { |image|
            @gallery.photos.create(image: image)
          }
      end
        redirect_to admin_calendars_path,:notice =>"Successfully created item."
    else
      render :edit
    end
  end
  
  def create
    @gallery = Calendar.new(params[:calendar])
    if @gallery.save
      if params[:images]
          params[:images].each { |image|
            @gallery.photos.create(image: image)
          }
      end
        redirect_to admin_calendars_path,:notice =>"Successfully created item."
    else
      render :new
    end
  end

      
  def destroy
    if request.xhr?
      cate = Calendar.find(params[:id])
      render :json =>{"status" => "failed"} if cate.blank?
      cate.destroy
      render :json =>{"status" => "ok"}
    end
  end

end