class OrdersController < ApplicationController

  def new
    order_params[:products]
    @order = Order.new
    @order_products = OrderItem.new
  end

  private
  def order_params
    params.require(:order_params).permit!
  end
end
