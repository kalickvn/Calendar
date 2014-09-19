class CategoriesController < ApplicationController
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
    @category = Category.new
  end

  def create
    @category = Category.new(params["category"])
    if @category.save
      redirect_to categories_path, :notice => "Successfully created ad listing."
    else
      render :action => 'new'
    end
  end

  def update
    
  end
  
  def destroy
    if request.xhr?
      cate = Category.find(params[:id])
      return :json =>{"status" => "failed"} if cate.blank?
      cate.destroy
      return :json =>{"status" => "ok"}
    end
  end
end