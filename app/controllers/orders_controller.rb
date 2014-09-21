class OrdersController < ApplicationController
  skip_authorize_resource
  def create
    @order = Order.new(params[:order])
    @order.calendar_id = params[:calendar_id]
    if @order.save
      Notifier.send_order(@order).deliver
      redirect_to send_product_contact_calendars_path and return
    else
      @calendar = Calendar.includes(:photos).find(params[:calendar_id])
      render :new
    end
  end

  def new
    redirect_to root_path and return if params[:calendar_id].blank?
    @calendar = Calendar.includes(:photos).find(params[:calendar_id])
    @order = Order.new
  end
end