class AdvertisingsController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  
  def new
    @advertising = Advertising.new  
  end
  
  def edit
     @advertising = Advertising.find(params[:id])
  end
  
  def create
    @advertising = Advertising.new(params[:advertising])
    if @advertising.save
      redirect_to advertisings_path
    else
      render :new
    end
  end

  def index
    if request.xhr?
      per_page = params[:iDisplayLength] ||  10
      page = params[:iDisplayStart] ? ((params[:iDisplayStart].to_i/per_page.to_i) + 1) : 1
      search_text = params["sSearch"] || ""
      cols = ["link","image"]
      
      sort_field =  cols[(params[:iSortCol_0].to_i)] + " " + params[:sSortDir_0].to_s
      @ads = Advertising.order(sort_field).paginate(:per_page => per_page,:page =>page)
      @ads.each do |i|
        i["image_url"] = i.image.url(:thumb)
      end
      render :json => {"aaData" => @ads,"iTotalRecords"=>@ads.length,"iTotalDisplayRecords"=>@ads.length}
    end
  end
  
  def update
    @advertising = Advertising.find(params[:id])
    if @advertising.update_attributes(params[:advertising])
      redirect_to advertisings_path
    else
      render :edit
    end
  end

  def destroy
    if request.xhr?
      cate = Advertising.find(params[:id])
      render :json =>{"status" => "failed"} if cate.blank?
      cate.destroy
      render :json =>{"status" => "ok"}
    end
  end
end