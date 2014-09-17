class CategoriesController < ApplicationController
  layout "admin"
  def index
  end
  def new
    @category = Category.new
  end

  def edit
    @category = Category.new
  end

  def create
    
  end

  def update
    
  end

end