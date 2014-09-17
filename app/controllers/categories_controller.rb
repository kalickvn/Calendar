class CategoriesController < ApplicationController
  layout "admin"
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