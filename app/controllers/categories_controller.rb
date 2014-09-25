class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  def index
    if request.xhr?
      per_page = params[:iDisplayLength] ||  10
      page = params[:iDisplayStart] ? ((params[:iDisplayStart].to_i/per_page.to_i) + 1) : 1
      search_text = params["sSearch"] || ""
      cols = ["name","description","is_show_menu","order_no"]
      puts "=========="
      puts params[:iSortCol_0].to_i
      puts cols[(params[:iSortCol_0].to_i)]
      puts params[:sSortDir_0]
      sort_field =  cols[(params[:iSortCol_0].to_i)] + " " + params[:sSortDir_0].to_s
      @categories = Category.order(sort_field).paginate(:per_page => per_page,:page =>page)
      render :json => {"aaData" => @categories,"iTotalRecords"=>@categories.length,"iTotalDisplayRecords"=>@categories.length}
    end
  end
  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(params["category"])
    if @category.save
      redirect_to categories_path, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params["category"])
      redirect_to categories_path, :notice => "Successfully update ad listing."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    if request.xhr?
      cate = Category.find(params[:id])
      render :json =>{"status" => "failed"} if cate.blank?
      cate.destroy
      render :json =>{"status" => "ok"}
    end
  end
end