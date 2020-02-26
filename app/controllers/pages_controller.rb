class PagesController < ApplicationController
  def home
    @products = Product.all
    @verticals = Vertical.all
    @top_products = Product.all[0..5]
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def checkout_success
  end

  def cart
    user_cart = JSON.parse(cookies[:cart])[current_user.id.to_s]
    if user_cart.nil?
      @cart_product = []
      return
    end
    product_ids = user_cart["products"]
    product_ids = product_ids.map {|i| i.to_i}
    if product_ids.empty?
      return nil
    end
    @cart_products = Product.find(product_ids)
  end

  def seller
    @seller_products = Product.select('id').where(user_id: current_user.id)
    @seller_sale=OrderItem.select(['price', 'quantity']).where(product_id: @seller_products).pluck(:price, :quantity)
    @sale = 0
    @seller_sale.each do |p,q|
      @sale += p*q
    end
  end

  def profile
    @previous_orders = Order.joins(:order_items).where(user_id:current_user.id)  
  end

end
