class PagesController < ApplicationController
  def home
    @products = Product.all
    @verticals = Vertical.all
    @top_products = Product.all[0..5]

    #OrderMailer.with(user:current_user).email.deliver_now!
  end

  def help
  end

  def about
  end

  def contact
  end
  
  def checkout_success
  end

  def search
    @query = search_params[:query]
    @results = Product.where("lower(name) like :search", search: "%#{@query}%")
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
    @seller_details = current_user.seller_details
  end

  def profile
    @previous_orders = Order.joins(:order_items).where(user_id:current_user.id)  
  end

  private
  def search_params
    params.require(:search).permit!
  end
end
