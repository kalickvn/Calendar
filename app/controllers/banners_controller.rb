class BannersController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  def edit
    @banner = Banner.first
    @banner = Banner.new if @banner.blank?
    puts @banner.inspect
  end
  
  def update
    @banner = Banner.first
    @banner = @banner.update_attributes(params[:banner])
    redirect_to edit_banner_path({:id => 1,:succes =>"true"})
  end

  def create
    @banner = Banner.new(params[:banner])
    if @banner.save
      redirect_to edit_banner_path({:id => 1,:success =>"true"})
    else
      render :edit
    end
  end
end