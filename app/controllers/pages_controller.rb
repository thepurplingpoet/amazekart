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
  
  def cart
    user_cart = JSON.parse(cookies[:cart])[current_user.id.to_s]
    if user_cart.nil?
      @cart_product = []
      return
    end
    product_ids = user_cart["products"]
    product_ids = product_ids.map {|i| i.to_i}
    @cart_products = Product.find(product_ids)
  end
end
