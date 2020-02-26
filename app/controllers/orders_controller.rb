class OrdersController < ApplicationController

  def new
    @orderitems = order_params[:products]
  end

  def show
    @previous_orders = Order.joins(:order_items).where(user_id:current_user.id)
  end

  def create
    update_products
    price = total_price_of_orders
    
    order_object_params = Hash.new
    @order = Order.new
    @order.price = price
    @order.user_id = current_user.id
    @order.save

    add_order_items(@order.id)

    clear_cookies

    redirect_to "/pages/checkout_success"
  end

  private

  def clear_cookies
    cart = JSON.parse(cookies[:cart])
  
    cart[current_user.id.to_s] = {
      products: []
    }
    cookies[:cart] = JSON.generate(cart)
  end
  
  def total_price_of_orders
    total_price = 0
    checkout_params.each do |item, quantity|
      total_price += Product.find(item.to_i).price * quantity.to_i
    end
    total_price.to_f
  end

  def update_products
    checkout_params.each do |item, quantity|
      quantity = quantity.to_i
      product = Product.find(item.to_i)
      if quantity > product.stock
        quantity = product.stock
      end
      product.stock -= quantity
      product.save
    end
  end

  def add_order_items(order_id)
    checkout_params.each do |item, quantity|
      product = Product.find(item.to_i)
      @order_product = OrderItem.new(order_id:order_id, product_id: product.id, price: product.price, quantity:quantity.to_i)
      @order_product.save
    end
  end

  def order_params
    params.require(:order_params).permit!
  end

  def checkout_params
    params.require(:cart).permit!
  end
end
